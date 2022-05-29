import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CheckOut.dart';
import 'package:flutter_application_1/Models/models_product.dart';
import 'package:flutter_application_1/Samyang-Cheese.dart';
import 'package:flutter_application_1/SettingSplashScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  late User user;

  History(this.user);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(user),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  late User user;
  MyStatefulWidget(this.user, {Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(user);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static num TotalPrice = 1;
  static num PriceTotal = 0;
  late User user;

  _MyStatefulWidgetState(this.user);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenPageSetting())), 
              style: ElevatedButton.styleFrom(
                primary: Colors.transparent
              ),
              child: Icon(Icons.arrow_back)),
            Padding(padding: EdgeInsets.only(left: 30)),
            Center(
              child: Text('History', style: TextStyle(fontSize: 25),),
            ),
            Padding(
              padding: EdgeInsets.only(right: 5.0),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
          Color.fromARGB(255, 0, 0, 0),
          Color.fromARGB(255, 117, 11, 3),
        ], radius: 2)),
        child: Column(
          children: [
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('History')
                    .doc(user.uid)
                    .collection('UserHistory')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    print('aaaa');
                    final product = snapshot.data!.docs;
                    print(product);

                    return ListView.builder(
                      itemCount: product.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        print('${TotalPrice}');
                        return History(product[index]['date'],
                            product[index]['Hour'], product[index]['Price']);
                      },
                    );
                  } else if (snapshot.hasError) {
                    print('error');
                    return Center(child: Text('No History'));
                  } else {
                    return Center(child: Text('No History'));
                  }
                }),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget History(String date, String Hour, num TotalPrice) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 400,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(120, 233, 110, 110)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Text(date, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Text(Hour, style: TextStyle(color: Colors.white, fontSize: 15)))
              ],
            ),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Text('Total Price', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    child: Text('${TotalPrice}', style: TextStyle(color: Colors.white, fontSize: 15)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
