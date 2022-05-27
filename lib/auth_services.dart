import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> SignInAnonymous() async {
    try {
      UserCredential results = await _auth.signInAnonymously();
      User? firebaseUser = results.user;

      return firebaseUser;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<User?> SignUp (String email, String password, String user, String Fname, String Lname, String Pnum, String Addres, String img) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      UserCredential results = await _auth.signInWithEmailAndPassword( email: email, password: password);
      User? firebaseUser = results.user;

      final UserDatabase =  FirebaseFirestore.instance
                            .collection('User')
                            .doc(firebaseUser!.uid)
                            .collection('UserList')
                            .doc();

      final json = {
        'Username' : user,
        'Fname' : Fname,
        'Lname' : Lname,
        'Pnum' : Pnum,
        'Email' : email,
        'img' : img,
      };

      await UserDatabase.set(json);

      final UserDatabaseaddres =  FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(firebaseUser.uid)
                                  .collection('AddresList')
                                  .doc();

      final json2 = {
        'Fname' : Fname,
        'Lname' : Lname,
        'Pnum' : Pnum,
        'Addres' : Addres
      };

      await UserDatabaseaddres.set(json2);

      SignOut();

    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<User?> SignIn(String email, String password) async {
    try {
      UserCredential results = await _auth.signInWithEmailAndPassword( email: email, password: password);
      User? firebaseUser = results.user;

      final SharedPreferences sharedPreferences2 =
        await SharedPreferences.getInstance();
      sharedPreferences2.setString('Userid', firebaseUser!.uid);

      return firebaseUser;

    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<void> SignOut() async {
    _auth.signOut();
  }

  static Future<void> PasswordForgot(String Email) async {
    _auth.sendPasswordResetEmail(email: Email);
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
