import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreenController with ChangeNotifier {
  Future<void> onLogin({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
      }
    }
  }
}
