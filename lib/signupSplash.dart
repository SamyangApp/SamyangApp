import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Signup2.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class SplashScreenPageSignup extends StatefulWidget {
  SplashScreenPageSignup({Key? key}) : super(key: key);

  @override
  State<SplashScreenPageSignup> createState() => _SplashScreenSignupState();
}

class _SplashScreenSignupState extends State<SplashScreenPageSignup> with TickerProviderStateMixin {
  late bool isLoading = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  dispose() {
  _controller.dispose(); // you need this
  super.dispose();
  }

  @override
   void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, 
    curve: Curves.ease);
    _controller.repeat(reverse: true);
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context); 

    return isLoading ? 
          Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            body: Center(
            child: FadeTransition(
              opacity: _animation,
              child: Image(image: AssetImage('Assets/10.png'), width: 100,),
              )
          ),
          ) : (firebaseUser == null ) ? SignUpPage() : MyApp();
  }
}
