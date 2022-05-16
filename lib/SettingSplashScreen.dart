import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/LoginSuccess.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/auth_services.dart';
class SplashScreenPageSetting extends StatefulWidget {
  SplashScreenPageSetting({Key? key}) : super(key: key);

  @override
  State<SplashScreenPageSetting> createState() => _SplashScreenStateSetting();
}

class _SplashScreenStateSetting extends State<SplashScreenPageSetting> {

  @override
  
 

  @override
  Widget build(BuildContext context) {
    User? firebaseUser = Provider.of<User?>(context); 

    return (firebaseUser == null ) ? LoginPage() : Settings();
  }
}
