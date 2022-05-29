import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Edit_Product.dart';
import 'package:flutter_application_1/LoginSuccesadmin.dart';
import 'package:flutter_application_1/Models/models_product.dart';
import 'package:flutter_application_1/Product_List_Screen/Product_List_Filter.dart';
import 'package:flutter_application_1/Product_List_Screen/Product_List_Filter_Price.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:flutter_application_1/SpashScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit_Product_List extends StatelessWidget {
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

class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {
  final int _count = 0;
  static String obtainedUser = '';
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
    getUserdoc();
    print(obtainedUser);
    super.initState();
  }

  void getUserdoc() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    obtainedUser = sharedPreferences.getString('Userid').toString();
  }

  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'Type';
    var dropdownValue2 = 'Price';

    String? type_Product;
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
              Padding(padding: const EdgeInsets.only(right: 1.0),
                child: IconButton(
                  onPressed: () { 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenPage()));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,                
                    ),
                alignment: const Alignment(0, 0),
                )
              ),
              Image(
                image: AssetImage('Assets/12.png'),
                height: 50,
              ),
              Padding(padding: const EdgeInsets.only(right: 1.0),
                child: IconButton(
                  onPressed: () { 
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.transparent,                
                    ),
                alignment: const Alignment(0, 0),
                )
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
        ),
        body: Column(
          children: [
            Expanded(
                child: SizedBox(
                    child: Column(
              children: [
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
                          builder: (context) => Edit_Product(name, a, r, g, b, isDark)));
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
