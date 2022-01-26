import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gd_firebase/auth_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text(FirebaseAuth.instance.currentUser.email),
      ),
    );
  }
}
