import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<UserCredential> createNewAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      verifyEmail();
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
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
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
}
