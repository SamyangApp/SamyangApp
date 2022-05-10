import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/auth_services.dart';

class LoginPageSuccess extends StatelessWidget {
 
  late final User user;

  LoginPageSuccess(this.user);

  @override


  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
        title: appTitle,
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
            backgroundColor: Colors.transparent,
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
                              Text(user.uid),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  minimumSize: const Size.fromHeight(50), // NEW
                                ),
                                onPressed: () async {
                                  AuthServices.SignOut();
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(fontSize: 24),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  ]
              ),
            ),  
          ),
          )
        )
      )
    );
  }

}