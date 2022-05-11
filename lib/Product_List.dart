import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/models_product.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:get/get.dart';

class Product_List extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final int _count = 0;

  final ImageList = [
    'Assets/16.png',
    'Assets/17.png',
    'Assets/15.png',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // or CupertinoApp
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('Assets/12.png'),
                height: 50,
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        ),
        body: SizedBox(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Product').snapshots(),
                builder: (context, AsyncSnapshot <QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    print('aaaa');
                    final product = snapshot.data!.docs;
                    print(product);

                    return GridView.builder(
                      itemCount: product.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 43,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Product_Card(product[index]['Product_Img'],product[index]['Product_Name'],product[index]['Product_Price'], product[index]['Product_Desc']);
                      },
                    );
                  } else {
                    print('error');
                    return Text('error');
                    
                  }}) 
              ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  Widget Product_Card(String url, String name, int Price, String Desc) {
    return Wrap(
      children: [
        InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SamyangCheese(Desc, name, Price, url)));
            },
            borderRadius: BorderRadius.circular(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: const RadialGradient(colors: [
                      Color.fromARGB(255, 172, 6, 6),
                      Color.fromARGB(255, 0, 0, 0)
                    ], radius: 1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: const Color.fromARGB(137, 192, 3, 3), width: 3)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      url ,
                      width: 160,
                      height: 180,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      maxLines: 10,
                    ),
                    SizedBox(height: 8),
                    Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Rp ${Price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}

