import 'package:flutter/material.dart';
import 'package:gd_firebase/auth_helper.dart';
import 'package:gd_firebase/auth_provider.dart';
import 'package:gd_firebase/firestore/firestore_helper.dart';
import 'package:gd_firebase/firestore/gd_user.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text('Name')),
              controller: nameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text('address')),
              controller: addressController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text('Phone')),
              controller: phoneController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text('Email')),
              controller: emailController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  label: Text('Password')),
              controller: passwordController,
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  GdUser user = GdUser(
                      address: 'Gaza',
                      email: 'shady@gmail.com',
                      name: 'omar',
                      password: 'qwert',
                      phone: '0592122122');
                  FirestoreHelper.firestoreHelper.createUser(user);
                  // AuthHelper.authHelper.registerUsingPhone();
                  // Provider.of<AuthProvider>(context, listen: false)
                  //     .forgetPassword(emailController.text);
                },
                child: Text('Forget password')),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    GdUser user = GdUser(
                        address: addressController.text,
                        email: emailController.text,
                        name: nameController.text,
                        password: passwordController.text,
                        phone: phoneController.text);
                    Provider.of<AuthProvider>(context, listen: false)
                        .createUser(user);
                  },
                  child: Text('Register')),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).login(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: Text('login')),
            )
          ],
        ),
      ),
    );
  }
}
