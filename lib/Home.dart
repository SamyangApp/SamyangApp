import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:flutter_application_1/Models/models_product.dart';
import 'package:flutter_application_1/SpashScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/Models/Models_Carosel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatelessWidget {
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
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
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
              mainAxisAlignment: MainAxisAlignment.center,
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
          body: SingleChildScrollView(
            child: Column(children: [
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                  aspectRatio: 1.6,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height),
              items: Carousel.Carousels.map(
                  (Carousels) => Carousel_Card(carousel: Carousels)).toList(),
            )),
            Recomended(title: 'Recommended'),
            SizedBox(
                height: 165,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Product_List')
                        .orderBy('Sold', descending: true)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        print('aaaa');
                        final product = snapshot.data!.docs;
                        print(product);

                        return GridView.builder(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              childAspectRatio: 1.1,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Recomen_Card(
                                  product[index]['Product_Name'],
                                  product[index]['Product_Img'],
                                  product[index]['Product_Price']);
                            });
                      } else {
                        print('error');
                        return Text('error');
                      }
                    })),
            Recomended(title: 'Ramen'),
            SizedBox(
                height: 165,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Product_List')
                        .where('type', isEqualTo: 'Ramen')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        print('aaaa');
                        final product = snapshot.data!;
                        print(product);

                        return ListView(
                            scrollDirection: Axis.horizontal,
                            children: product.docs
                                .map((e) => Recomen_Card(e['Product_Name'],
                                    e['Product_Img'], e['Product_Price']))
                                .toList());
                      } else {
                        print('error');
                        return Text('error');
                      }
                    })),
            Recomended(title: 'Ramen Cup'),
            SizedBox(
                height: 165,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Product_List')
                        .where('type', isEqualTo: 'CupRamen')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        print('aaaa');
                        final product = snapshot.data!;
                        print(product);

                        return ListView(
                            scrollDirection: Axis.horizontal,
                            children: product.docs
                                .map((e) => Recomen_Card(e['Product_Name'],
                                    e['Product_Img'], e['Product_Price']))
                                .toList());
                      } else {
                        print('error');
                        return Text('error');
                      }
                    })),
            Recomended(title: 'Samyang Sauce'),
            SizedBox(
                height: 165,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Product_List')
                        .where('type', isEqualTo: 'Sauce')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        print('aaaa');
                        final product = snapshot.data!;
                        print(product);

                        return ListView(
                            scrollDirection: Axis.horizontal,
                            children: product.docs
                                .map((e) => Recomen_Card(e['Product_Name'],
                                    e['Product_Img'], e['Product_Price']))
                                .toList());
                      } else {
                        print('error');
                        return Text('error');
                      }
                    })),
            SizedBox(
              height: 60,
            )
          ])
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ));
  }

  Widget Recomen_Card(String Name, String url, int price) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 100,
                child: Image.network(url, fit: BoxFit.cover)),
            Positioned(
                top: 70,
                child: Container(
                    padding: EdgeInsets.only(left: 10),
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50,
                    decoration:
                        BoxDecoration(color: Colors.black.withAlpha(100)),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              child: Text(
                                Name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              child: Text(
                                'Rp '
                                '${price}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () async {
                               SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                                var obtainedUser = sharedPreferences.getString('Userid');
                                print(obtainedUser);
                              if (obtainedUser == null) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenPage()));
                                showToast2();
                                print('null ege');
                              } else if (obtainedUser != null) {
                                CreateCart(name: Name, Url: url, Price: price);
                                showToast();
                                print('aa');
                                print(obtainedUser);
                                
                              }
                              CreateCart(name: Name, Url: url, Price: price);
                              showToast();

                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.white,
                            ))
                      ],
                    )))
          ],
        ));
  }
  void showToast() => Fluttertoast.showToast(
    msg: 'Product added to cart');

  void showToast2() => Fluttertoast.showToast(
    msg: 'You need to login first');


  Future CreateCart({required String name, required String Url, required int Price}) async {
     SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedUser = sharedPreferences.getString('Userid');
    print(obtainedUser);
    final docCart = FirebaseFirestore.instance.collection('Cart').doc(obtainedUser).collection('UserCart').doc(name);

    final json = {
      'ProductName': name,
      'Count' : 1,
      'Product_Img' : Url,
      'ProductPrice' : Price,
      'id' : obtainedUser,
      'TotalPrice' : Price
    };
    await docCart.set(json);
  }
}

class Carousel_Card extends StatelessWidget {
  final Carousel carousel;

  Carousel_Card({
    Key? key,
    required this.carousel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 40, top: 30),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(carousel.ProductUrl,
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      carousel.ProductNames,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}

class Recomended extends StatelessWidget {
  final String title;

  Recomended({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
