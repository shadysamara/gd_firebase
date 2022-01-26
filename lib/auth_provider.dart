import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/Home_page.dart';
import 'package:gd_firebase/auth_helper.dart';
import 'package:gd_firebase/main_auth_screen.dart';
import 'package:gd_firebase/router_helper.dart';

class AuthProvider extends ChangeNotifier {
  createUser({String email, String password}) async {
    try {
      UserCredential x =
          await AuthHelper.authHelper.createNewAccount(email, password);
      if (x != null) {
        RouterHelper.routerHelper.routingToSpecificWidget(HomePage());
        // navigate to home
      } else {
        log('error occured');
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  login({String email, String password}) async {
    UserCredential x = await AuthHelper.authHelper.signIn(email, password);
    if (x != null) {
      RouterHelper.routerHelper.routingToSpecificWidget(HomePage());
      // navigate to home
    } else {
      log('error occured');
    }
  }

  logOut() async {
    await AuthHelper.authHelper.logout();
    RouterHelper.routerHelper.routingToSpecificWidget(RegisterScreen());
  }

  forgetPassword(String email) async {
    AuthHelper.authHelper.forgetPassword(email);
  }
}
