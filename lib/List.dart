import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:flutter_application_1/Icons.dart';

class ListSamyang extends StatefulWidget {
  ListSamyang({Key? key}) : super(key: key);

  @override
  State<ListSamyang> createState() => _ListSamyangState();
}

class _ListSamyangState extends State<ListSamyang> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Text('Hottest Samyang Ever', style: TextStyle(fontFamily: 'SummerFire', color: Colors.black),)
          ],
        ),
      ),
    );
  }
}