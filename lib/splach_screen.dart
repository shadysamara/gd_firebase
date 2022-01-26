import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/Home_page.dart';
import 'package:gd_firebase/main_auth_screen.dart';
import 'package:gd_firebase/router_helper.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((v) {
      User user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        RouterHelper.routerHelper.routingToSpecificWidget(RegisterScreen());
      } else {
        RouterHelper.routerHelper.routingToSpecificWidget(HomePage());
      }
    });
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
