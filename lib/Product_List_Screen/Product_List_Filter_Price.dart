import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/models_product.dart';
import 'package:flutter_application_1/Product_List_Screen/Product_List.dart';
import 'package:flutter_application_1/Product_List_Screen/Product_List_Filter.dart';
import 'package:flutter_application_1/Product_List_Screen/Product_List_Filter_Price.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product_List_Filter_Price extends StatelessWidget {
  late final bool type;
  static const String _title = 'Flutter Code Sample';

  Product_List_Filter_Price(this.type);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(type),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  late bool typeProc;


  MyStatefulWidget(this.typeProc, {Key? key})
      : super(key: key);

  @override
  State<MyStatefulWidget> createState() =>
      _MyStatefulWidgetState(typeProc);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>  with TickerProviderStateMixin{
  
  late final bool type;
  var dropdownValue = 'Type';
  var dropdownValue2 = 'Price';
  late bool isLoading = true;
  late AnimationController _controller;
  late Animation<double> _animation;

   _MyStatefulWidgetState(this.type);

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
    getUserdoc();
    print(obtainedUser);
    super.initState();
  }

  static String obtainedUser = '';

  void getUserdoc() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    obtainedUser = sharedPreferences.getString('Userid').toString();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? 
          Scaffold(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            body: Center(
            child: FadeTransition(
              opacity: _animation,
              child: Image(image: AssetImage('Assets/10.png'), width: 100,),
              )
          ),
          )
          : MaterialApp(
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
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Product_List()));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              Image(
                image: AssetImage('Assets/12.png'),
                height: 50,
              ),
              SizedBox(
                width: 50,
              )
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
                      Text('Filter', style: TextStyle(color: Colors.white)),
                      Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor: Color.fromARGB(255, 0, 0, 0)),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Type',
                              'All',
                              'Ramen',
                              'Ramen Cup',
                              'Samyang Sauce',
                              'Other'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent)),
                                    onPressed: () {
                                      if (value == 'All') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List()));
                                      }
                                      if (value == 'Ramen') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List_Filter(
                                                        'Ramen')));
                                      }
                                      if (value == 'Ramen Cup') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List_Filter(
                                                        'CupRamen')));
                                      }
                                      if (value == 'Samyang Sauce') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List_Filter('Sauce')));
                                      }
                                      if (value == 'Other') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List_Filter(
                                                        'Other')));
                                      }
                                      print(value);
                                      print(type);
                                    },
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              );
                            }).toList(),
                          )),
                      Text('Filter', style: TextStyle(color: Colors.white)),
                      Theme(
                          data: Theme.of(context).copyWith(
                              canvasColor: Color.fromARGB(255, 0, 0, 0)),
                          child: DropdownButton<String>(
                            value: dropdownValue2,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            onChanged: (String? newValue2) {
                              setState(() {
                                dropdownValue2 = newValue2!;
                              });
                            },
                            items: <String>[
                              'Price',
                              'All',
                              'Low To High',
                              'High To Low',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.transparent)),
                                    onPressed: () {
                                      if (value == 'All') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List()));
                                      }
                                      if (value == 'Low To High') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List_Filter_Price(
                                                        false)));
                                      }
                                      if (value == 'High To Low') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Product_List_Filter_Price(
                                                        true)));
                                      }
                                      print(value);
                                    },
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.white),
                                    )),
                              );
                            }).toList(),
                          ))
                    ],
                  ),
                  Expanded(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Product_List')
                              .orderBy('Product_Price', descending: type)
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
                          })),
                ],
              ),
            )),
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
                            color: Color.fromARGB(137, 192, 3, 3),
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
