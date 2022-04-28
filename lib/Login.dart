import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            )
        ),
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
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Image(image: AssetImage('Assets/10.png'),width:100)
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Image(image: AssetImage('Assets/11.png'),width:100)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(122, 247, 5, 5),
                          width: 3
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Color.fromARGB(122, 247, 5, 5),
                        width: 3)
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ), // myIcon is a 48px-wide widget.
                      ),
                      hintText: 'Username',
                      hintStyle: const TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(122, 247, 5, 5),
                          width: 3
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Color.fromARGB(122, 247, 5, 5),
                        width: 3)
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ), // myIcon is a 48px-wide widget.
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.white)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
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
                            onPressed: () {},
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
                      const Text(
                        'Don’t have an Account ?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: const Text(
                          " Sign Up ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      )
                    ],
                  )
                ),
              ],
            )
          ),
        ),
        ),
        backgroundColor: Colors.transparent,  
      ),
      )
    );
  }
}