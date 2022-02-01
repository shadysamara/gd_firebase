// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gd_firebase/Home_page.dart';
// import 'package:gd_firebase/firestore/data/auth_helper.dart';
// import 'package:gd_firebase/firestore/data/firestore_helper.dart';
// import 'package:gd_firebase/firestore/models/gd_user.dart';
// import 'package:gd_firebase/firestore/models/gd_user.dart';
// import 'package:gd_firebase/firestore/ui/register_screen.dart';
// import 'package:gd_firebase/router_helper.dart';

// class AuthProvider extends ChangeNotifier {
//   createUser(GdUser gdUser) async {
//     try {
//       S x = await AuthHelper.authHelper
//           .createNewAccount(gdUser.email, gdUser.password);
//       ////
//       gdUser.id = x.user.uid;

//       if (x != null) {
//         RouterHelper.routerHelper.routingToSpecificWidget(HomePage());
//         // navigate to home
//       } else {
//         log('error occured');
//       }
//     } on Exception catch (e) {
//       log(e.toString());
//     }
//   }

//   login({String email, String password}) async {
//     try {
//       UserCredential x = await AuthHelper.authHelper.signIn(email, password);
//       if (x != null) {
//         RouterHelper.routerHelper.routingToSpecificWidget(HomePage());
//         // navigate to home
//       } else {
//         log('error occured');
//       }
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }

//   logOut() async {
//     await AuthHelper.authHelper.logout();
//     RouterHelper.routerHelper.routingToSpecificWidget(RegisterScreen());
//   }

//   forgetPassword(String email) async {
//     AuthHelper.authHelper.forgetPassword(email);
//   }
// }
