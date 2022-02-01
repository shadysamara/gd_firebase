import 'package:flutter/material.dart';
import 'package:gd_firebase/firestore/data/auth_helper.dart';
import 'package:gd_firebase/firestore/providers/app_provider.dart';
import 'package:gd_firebase/firestore/providers/auth_provider.dart';
import 'package:gd_firebase/firestore/data/firestore_helper.dart';
import 'package:gd_firebase/firestore/models/gd_user.dart';
import 'package:gd_firebase/firestore/ui/register_screen.dart';
import 'package:gd_firebase/firestore/ui/widgets/custom_button.dart';
import 'package:gd_firebase/router_helper.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
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
              title: 'Login',
              function: () {
                Provider.of<AppProvider>(context, listen: false)
                    .login(emailController.text, passwordController.text);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  RouterHelper.routerHelper
                      .routingToSpecificWidget(RegisterScreen());
                },
                child: Text('Create account'))
          ],
        ),
      ),
    );
  }
}
