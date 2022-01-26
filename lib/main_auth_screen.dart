import 'package:flutter/material.dart';
import 'package:gd_firebase/auth_helper.dart';
import 'package:gd_firebase/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: emailController,
          ),
          TextField(
            controller: passwordController,
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                AuthHelper.authHelper.registerUsingPhone();
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
                  Provider.of<AuthProvider>(context, listen: false).createUser(
                      email: emailController.text,
                      password: passwordController.text);
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
    );
  }
}
