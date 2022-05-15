import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cart.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/LoginSuccess.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/auth_services.dart';
class CartSplashScreenPage extends StatefulWidget {
  CartSplashScreenPage({Key? key}) : super(key: key);

  @override
  State<CartSplashScreenPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<CartSplashScreenPage> {

  @override
  
 

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context); 

    return (firebaseUser == null ) ? LoginPage() : Cart();
  }
}
