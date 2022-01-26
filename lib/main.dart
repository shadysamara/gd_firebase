import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/auth_provider.dart';
import 'package:gd_firebase/main_auth_screen.dart';
import 'package:gd_firebase/router_helper.dart';
import 'package:gd_firebase/splach_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        navigatorKey: RouterHelper.routerHelper.routerKey,
        home: SplachScreen(),
      )));
}
