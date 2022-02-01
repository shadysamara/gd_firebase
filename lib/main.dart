import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:gd_firebase/firestore/providers/auth_provider.dart';
import 'package:gd_firebase/firestore/ui/add_product.dart';
import 'package:gd_firebase/firestore/ui/all_products_screen.dart';
import 'package:gd_firebase/firestore/ui/register_screen.dart';
import 'package:gd_firebase/router_helper.dart';
import 'package:gd_firebase/splach_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<AppProvider>(
      create: (context) => AppProvider(),
      child: MaterialApp(
        navigatorKey: RouterHelper.routerHelper.routerKey,
        home: SplachScreen(),
      )));
}
