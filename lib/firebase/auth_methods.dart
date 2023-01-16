import 'dart:math';

import 'package:chat_app/firebase/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Authmethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up a User
  Future<String> SignupUser({
    required String email,
    required String password,
    required String fName,
    required String lName,
    required Uint8List? file,
  }) async {
    String res = 'Something went wrong';
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          fName.isNotEmpty &&
          lName.isNotEmpty &&
          file != null) {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        ;

        String urlOfImg =
            await SotrageMethods().uploadImage('profile', file, false);

        await _firestore.collection('users').doc(user.user!.uid).set({
          'First Nmae': fName,
          'Last Name': lName,
          'Email': email,
          'uid': user.user!.uid,
          'profileUrl': urlOfImg
        });

        res = 'success';
      }
    } on FirebaseAuthException catch (e) {
      print("Its working 1111111111111111111");
      res = e.code;
    } catch (e) {
      print("Its working 1111111111111111111");
      res = e.toString();
    }

    return res;
  }

  // Login User

}
