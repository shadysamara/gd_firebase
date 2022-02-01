import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> createNewAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
