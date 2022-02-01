import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/data/auth_helper.dart';
import 'package:gd_firebase/firestore/data/firestore_helper.dart';
import 'package:gd_firebase/firestore/models/gd_user.dart';
import 'package:gd_firebase/firestore/models/product_model.dart';
import 'package:gd_firebase/firestore/ui/add_product.dart';
import 'package:gd_firebase/firestore/ui/all_products_screen.dart';
import 'package:gd_firebase/firestore/ui/login_screen.dart';
import 'package:gd_firebase/router_helper.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getAllProducts();
  }
  GdUser loggedUser;
  File file;
  String imageUrl;
  List<Product> allProducts;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  pickNewImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    notifyListeners();
  }

  register(GdUser gdUser) async {
    try {
      String userId = await AuthHelper.authHelper
          .createNewAccount(gdUser.email, gdUser.password);
      gdUser.id = userId;
      await FirestoreHelper.firestoreHelper.createUserInFs(gdUser);
      this.loggedUser = gdUser;
      RouterHelper.routerHelper.routingToSpecificWidget(AllProductsScreen());
    } on Exception catch (e) {
      // TODO
    }
  }

  login(String email, String password) async {
    try {
      UserCredential userCredential =
          await AuthHelper.authHelper.signIn(email, password);
      await getUserFromFirebase();
      RouterHelper.routerHelper.routingToSpecificWidget(AllProductsScreen());
    } on Exception catch (e) {
      // TODO
    }
  }

  getUserFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    this.loggedUser =
        await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    notifyListeners();
  }

  logOut() async {
    this.loggedUser = null;
    await AuthHelper.authHelper.logout();

    RouterHelper.routerHelper.routingToSpecificWidget(LoginScreen());
  }

  addProduct() async {
    String imageUrl =
        await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    Product product = Product(
        name: nameController.text,
        description: descriptionController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addNewProduct(product);
    getAllProducts();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }

  editProduct(String productiD) async {
    log(productiD ?? 'null');
    if (file != null) {
      this.imageUrl =
          await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    }
    Product product = Product(
        id: productiD,
        name: nameController.text,
        description: descriptionController.text,
        price: num.parse(priceController.text));
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.editProduct(product);
    getAllProducts();
    Navigator.of(RouterHelper.routerHelper.routerKey.currentState.context)
        .pop();
  }

  goToEditProduct(Product product) {
    this.file = null;
    this.nameController.text = product.name;
    this.descriptionController.text = product.description;
    this.priceController.text = product.price.toString();
    this.imageUrl = product.imageUrl;
    notifyListeners();
    RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(AddNewProduct(
      isForEdit: true,
      productId: product.id,
    ));
  }

  getAllProducts() async {
    this.allProducts = await FirestoreHelper.firestoreHelper.getAllProducts();
    notifyListeners();
  }

  deleteProduct(String productiD) async {
    await FirestoreHelper.firestoreHelper.deleteProruct(productiD);
    getAllProducts();
  }
}
