import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/data/auth_helper.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:gd_firebase/firestore/providers/auth_provider.dart';
import 'package:gd_firebase/firestore/data/firestore_helper.dart';
import 'package:gd_firebase/firestore/models/gd_user.dart';
import 'package:gd_firebase/firestore/ui/login_screen.dart';
import 'package:gd_firebase/firestore/ui/widgets/custom_button.dart';
import 'package:gd_firebase/router_helper.dart';
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
          children: [
            SingleChildScrollView(
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Register',
              function: () {
                GdUser user = GdUser(
                    address: addressController.text,
                    email: emailController.text,
                    name: nameController.text,
                    password: passwordController.text,
                    phone: phoneController.text);
                Provider.of<AppProvider>(context, listen: false).register(user);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  RouterHelper.routerHelper
                      .routingToSpecificWidget(LoginScreen());
                },
                child: Text('Have already account'))
          ],
        ),
      ),
    );
  }
}
