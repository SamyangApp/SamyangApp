import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';

class AturRekening extends StatelessWidget {
  const AturRekening({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
        title: appTitle,
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: BoxDecoration(
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
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Container(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(122, 247, 5, 5),
                                    width: 3)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(122, 247, 5, 5),
                                    width: 3)),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(122, 247, 5, 5),
                                    width: 3)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(122, 247, 5, 5),
                                    width: 3)),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 20),
                            ),
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 1),
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
                                'Save',
                                style: TextStyle(fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
