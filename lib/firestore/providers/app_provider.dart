import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/data/auth_helper.dart';
import 'package:gd_firebase/firestore/data/firestore_helper.dart';
import 'package:gd_firebase/firestore/models/gd_user.dart';
import 'package:gd_firebase/firestore/models/product_model.dart';
import 'package:image_picker/image_picker.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    getAllProducts();
  }
  GdUser loggedUser;
  File file;
  List<Product> allProducts;
  pickNewImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(file.path);
    notifyListeners();
  }

  register(GdUser gdUser) async {
    UserCredential userCredential = await AuthHelper.authHelper
        .createNewAccount(gdUser.email, gdUser.password);
    gdUser.id = userCredential.user.uid;
    await FirestoreHelper.firestoreHelper.createUserInFs(gdUser);
    this.loggedUser = gdUser;
  }

  login(String email, String password) async {
    UserCredential userCredential =
        await AuthHelper.authHelper.signIn(email, password);
    String id = userCredential.user.uid;
    GdUser gdUser = await FirestoreHelper.firestoreHelper.getUserFromFs(id);
    this.loggedUser = gdUser;
  }

  addProduct(Product product) async {
    String imageUrl =
        await FirestoreHelper.firestoreHelper.uploadImage(this.file);
    product.imageUrl = imageUrl;
    await FirestoreHelper.firestoreHelper.addNewProduct(product);
  }

  getAllProducts() async {
    this.allProducts = await FirestoreHelper.firestoreHelper.getAllProducts();
    notifyListeners();
  }
}
