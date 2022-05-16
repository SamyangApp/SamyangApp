import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/models_product.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  static String obtainedUser = '';

  void getUserdoc() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    obtainedUser = sharedPreferences.getString('Userid').toString();
  }

  @override
  void initState() {
    getUserdoc();
    print(obtainedUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'One';
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
        body: Column(
          children: [
            Expanded(
                child: SizedBox(
                    child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'One', 
                        'Two', 
                        'Free', 
                        'Four'
                        ]
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['One', 'Two', 'Free', 'Four']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                Expanded(
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Product_List')
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            print('aaaa');
                            final product = snapshot.data!.docs;
                            print(product);

                            return GridView.builder(
                              itemCount: product.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 43,
                                crossAxisSpacing: 5,
                                childAspectRatio: 0.75,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Product_Card(
                                    product[index]['Product_Img'],
                                    product[index]['Product_Name'],
                                    product[index]['Product_Price'],
                                    product[index]['Product_Desc'],
                                    product[index]['Color_a'],
                                    product[index]['Color_r'],
                                    product[index]['Color_g'],
                                    product[index]['Color_b'],
                                    product[index]['isDark']);
                              },
                            );
                          } else {
                            print('error');
                            return Text('error');
                          }
                        }))
              ],
            ))),
            SizedBox(
              height: 10,
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  Widget Product_Card(String url, String name, int Price, String Desc, int a,
      int r, int g, int b, bool isDark) {
    return Wrap(children: [
      Center(
        child: Container(
            width: 185,
            height: 290,
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SamyangCheese(Desc, name, Price,
                              url, a, r, g, b, isDark, obtainedUser)));
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
                            color: const Color.fromARGB(137, 192, 3, 3),
                            width: 3)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          url,
                          width: 160,
                          height: 180,
                        ),
                        FittedBox(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            maxLines: 10,
                          ),
                        ),
                        SizedBox(height: 8),
                        FittedBox(
                          child: Text(
                            name,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
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
                ))),
      )
    ]);
  }
}
