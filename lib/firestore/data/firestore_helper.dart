import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:gd_firebase/firestore/models/gd_user.dart';
import 'package:gd_firebase/firestore/models/product_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  createUserInFs(GdUser gdUser) async {
    firebaseFirestore.collection('users').doc(gdUser.id).set(gdUser.toMap());
  }

  Future<GdUser> getUserFromFs(String id) async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await firebaseFirestore.collection('users').doc(id).get();
    Map<String, dynamic> userData = document.data();
    userData['id'] = document.id;
    GdUser gdUser = GdUser.fromMap(userData);
    return gdUser;
  }

  //// admin
  addNewProduct(Product product) async {
    DocumentReference<Map<String, dynamic>> doc =
        await firebaseFirestore.collection('products').add(product.toMap());
    log(doc.id);
  }

  Future<String> uploadImage(File file) async {
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('products/$fileName');
    await reference.putFile(file);
    String imageUrl = await reference.getDownloadURL();
    return imageUrl;
  }

  editProduct(Product newProduct) async {
    await firebaseFirestore
        .collection('products')
        .doc(newProduct.id)
        .update(newProduct.toMap());
  }

  deleteProruct(String productId) async {
    await firebaseFirestore.collection('products').doc(productId).delete();
  }

  Future<Product> getOneProduct(String productId) async {
    DocumentSnapshot<Map<String, dynamic>> productSnapshot =
        await firebaseFirestore.collection('products').doc(productId).get();
    Map<String, dynamic> productMap = productSnapshot.data();
    productMap['id'] = productSnapshot.id;
    Product product = Product.fromMap(productMap);
    return product;
  }

  Future<List<Product>> getAllProducts() async {
    QuerySnapshot<Map<String, dynamic>> allProductsSnapshot =
        await firebaseFirestore.collection('products').get();

    List<Product> allProducts = allProductsSnapshot.docs.map((e) {
      Map documentMap = e.data();
      documentMap['id'] = e.id;
      Product product = Product.fromMap(documentMap);
      return product;
    }).toList();
    return allProducts;
  }

  addProductToCart(Product product) async {
    String myid = FirebaseAuth.instance.currentUser.uid;
    firebaseFirestore
        .collection('users')
        .doc(myid)
        .collection('cart')
        .add(product.toMap());
  }
}
