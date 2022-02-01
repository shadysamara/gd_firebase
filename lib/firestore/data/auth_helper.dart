import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String> createNewAccount(String email, String password) async {
    try {
      String enterdEmail = email;
      String enteredPassword = password;
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: enterdEmail, password: enteredPassword);

      return userCredential.user.uid;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<UserCredential> signIn(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  }

  logout() async {
    await firebaseAuth.signOut();
  }

  forgetPassword(String email) async {
    firebaseAuth.sendPasswordResetEmail(email: email);
  }

  verifyEmail() async {
    firebaseAuth.currentUser.sendEmailVerification();
  }

  registerUsingPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+972592189159',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        log(verificationId);
        log(resendToken.toString());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
