import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/Home_page.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:gd_firebase/firestore/ui/all_products_screen.dart';
import 'package:gd_firebase/firestore/ui/register_screen.dart';
import 'package:gd_firebase/router_helper.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((v) {
      User user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        RouterHelper.routerHelper.routingToSpecificWidget(RegisterScreen());
      } else {
        Provider.of<AppProvider>(context, listen: false).getUserFromFirebase();
        RouterHelper.routerHelper.routingToSpecificWidget(AllProductsScreen());
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
