import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Forgot_password.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/SpashScreen.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/LoginSuccess.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/Forgot_password.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void initState() {
    bool _passwordVisible = false;
  }

  @override
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  int Count = 0;

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return GetMaterialApp(
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
                        controller: user,
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
                            hintText: 'Username',
                            hintStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      child: TextField(
                        controller: pass,
                        obscureText: true,
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
                                Icons.lock,
                                color: Colors.white,
                              ), // myIcon is a 48px-wide widget.
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPasswordPage()));
                              },
                              child: const Text(
                                "Forgot Password",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                        ],
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
                                AuthServices.SignIn(user.text, pass.text);
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
                                AuthServices.SignInAnonymous();
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
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not Have Avc',
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ResetPasswordPage()));
                              },
                              child: const Text(
                                " Sign Up ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )),
                  ],
                )),
              ),
            ),
            backgroundColor: Colors.transparent,
          ),
        ));
  }
}
