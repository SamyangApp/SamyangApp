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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  late User user;

  Cart(this.user);

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

  @override
  void OrderIncrement(String name, int price) {
    final docCart = FirebaseFirestore.instance
        .collection('Cart')
        .doc(user.uid)
        .collection('UserCart')
        .doc(name);
    docCart.update({
      'Count': FieldValue.increment(1),
      'TotalPrice': FieldValue.increment(price)
    });
  }

  void OrderDecrement(String name, int count, int price) {
    final docCart = FirebaseFirestore.instance
        .collection('Cart')
        .doc(user.uid)
        .collection('UserCart')
        .doc(name);
    if (count > 1) {
      docCart.update({
        'Count': FieldValue.increment(-1),
        'TotalPrice': FieldValue.increment(-price)
      });
    } else {
      docCart.delete();
    }
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      const CircularProgressIndicator();
    });

    super.initState();
  }

  Future<String> getAddress() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString('Address') ?? "Rumah";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_cart),
            Padding(padding: EdgeInsets.only(left: 30)),
            Center(
              child: Text('Cart'),
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
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Cart')
                      .doc(user.uid)
                      .collection('UserCart')
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
                          print('$TotalPrice');
                          return CartList(
                              product[index]['Product_Img'],
                              product[index]['ProductName'],
                              product[index]['ProductPrice'],
                              product[index]['Count']);
                        },
                      );
                    } else if (snapshot.hasError) {
                      print('error');
                      return const Text('error');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Container(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Cart')
                        .doc(user.uid)
                        .collection('UserCart')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        var ds = snapshot.data!.docs;
                        num sum = 0;
                        for (int i = 0; i < ds.length; i++) {
                          sum += (ds[i]['TotalPrice']);
                        }
                        return (TotalPriceTab(sum));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget TotalPriceTab(num Pricetotal) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total Belanja',
                  style: TextStyle(color: Colors.white, fontSize: 18)),
              const Padding(padding: EdgeInsets.only(left: 20)),
              Text('$Pricetotal',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold))
            ],
          )),
          SizedBox(
              width: 160,
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(183, 87, 3, 3),
                  ),
                  onPressed: () {
                    if (Pricetotal == 0) {
                      showtoast();
                      print(Pricetotal);
                    }
                    if (Pricetotal > 0) {
                      getAddress().then((address) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CheckOutPage(user, address)));
                      });
                    }
                  },
                  child: CartButton(),
                ),
              )),
        ],
      ),
    );
  }

  void showtoast() =>
      Fluttertoast.showToast(msg: 'You dont have any item in the cart');

  Widget CartButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_cart_checkout, color: Colors.white),
            Padding(padding: EdgeInsets.only(left: 20)),
            Text('Checkout', style: TextStyle(color: Colors.white)),
          ],
        )),
      ),
    );
  }

  Widget CartList(String url, String name, int price, int Count) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.network(url, width: 90),
        SizedBox(
          width: 170,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                ),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Text('Rp $price', style: const TextStyle(color: Colors.white))
            ],
          ),
        ),
        Row(
          children: [
            Material(
              type: MaterialType.transparency,
              child: IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    OrderIncrement(name, price);
                  },
                  icon: const Icon(Icons.add, size: 18),
                  color: Colors.white),
            ),
            Text(
              '$Count',
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            Material(
              type: MaterialType.transparency,
              child: IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {
                  OrderDecrement(name, Count, price);
                },
                icon: const Icon(Icons.remove, color: Colors.white, size: 18),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
