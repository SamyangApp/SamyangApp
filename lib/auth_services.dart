import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> SignUp (String email, String password, String user, String Fname, String Lname, String Pnum, String Addres, File? _image, String url2) async {
    try{
      
      String url = '';

      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      UserCredential results = await _auth.signInWithEmailAndPassword( email: email, password: password);
      User? firebaseUser = results.user;

      final ref = FirebaseStorage.instance
        .ref()
        .child('UserImage')
        .child(firebaseUser!.uid + '.jpg');
        await ref.putFile(_image!);
        url = await ref.getDownloadURL();
        print(url);

      final UserDatabase =  FirebaseFirestore.instance
                            .collection('User')
                            .doc(firebaseUser.uid)
                            .collection('UserList')
                            .doc();

      final json = {
        'Username' : user,
        'Fname' : Fname,
        'Lname' : Lname,
        'Pnum' : Pnum,
        'Email' : email,
        'img' : (url == null) ? url2 : url,
      };

      await UserDatabase.set(json);

      final UserDatabaseaddres =  FirebaseFirestore.instance
                                  .collection('User')
                                  .doc(firebaseUser.uid)
                                  .collection('AddresList')
                                  .doc('Rumah');

      final json2 = {
        'Fname' : Fname,
        'Lname' : Lname,
        'Pnum' : Pnum,
        'Addres' : Addres,
        'AddresName' : 'Rumah',
        'UidAddres' : 'Rumah',
        'Chosen' : true
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
