import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/SpashScreen.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/LoginSuccess.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends StatelessWidget {

  @override

  TextEditingController email = new TextEditingController(); 

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 189, 4, 4),
              Color.fromARGB(255, 107, 10, 3),
              Color.fromARGB(255, 34, 3, 1),
              Color.fromARGB(255, 117, 11, 3),
              Color.fromARGB(255, 185, 3, 3),
            ],
          )),
          child: Scaffold(
            body: Center(
              child: Container(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                        child: Image(
                            image: AssetImage('Assets/10.png'), width: 100)),
                    const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                        child: Image(
                            image: AssetImage('Assets/11.png'), width: 100)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      child: TextField(
                        controller: email,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(122, 247, 5, 5),
                                    width: 3)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(122, 247, 5, 5),
                                    width: 3)),
                            prefixIcon: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ), // myIcon is a 48px-wide widget.
                            ),
                            hintText: 'Email',
                            hintStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(255, 255, 0, 0),
                                      Color.fromARGB(255, 134, 11, 11),
                                      Color.fromARGB(255, 88, 3, 3),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () async {
                                AuthServices.PasswordForgot(email.text);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Reset Password',
                                style: TextStyle(fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        ));
  }
}
