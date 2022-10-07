import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/LoginSuccesadmin.dart';
import 'package:flutter_application_1/LoginSuccess.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
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
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.repeat(reverse: true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context);

    return isLoading
        ? Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            body: Center(
                child: FadeTransition(
              opacity: _animation,
              child: const Image(
                image: AssetImage('Assets/10.png'),
                width: 100,
              ),
            )),
          )
        : (firebaseUser != null &&
                firebaseUser.uid == 'MhaCWXyi9DOA0DGPVPdMYgg6Snj1')
            ? LoginPageSuccessadmin(firebaseUser)
            : (firebaseUser != null &&
                    firebaseUser != 'MhaCWXyi9DOA0DGPVPdMYgg6Snj1')
                ? LoginPageSuccess(firebaseUser)
                : LoginPage();
  }
}
