import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CheckOut.dart';
import 'package:flutter_application_1/Samyang-Cheese.dart';

class Cart extends StatelessWidget {
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
  int Count = 1;

  @override
  void OrderIncrement() {
    setState(() {
      Count++;
    });
  }

  void OrderDecrement() {
    setState(() {
      if (Count == 1) {
        Count;
      } else {
        Count--;
      }
    });
  }

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
              child: Column(
                children: [
                  CartList(),
                  CartList(),
                  CartList(),
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              thickness:1,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Belanja', style: TextStyle(color: Colors.white, fontSize: 18)),
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Text('Rp ${Count * 21},000', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold))
                    ],
                  )
                ),
                Container(
                  width: 170,
                    child: SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(183, 87, 3, 3),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context, MaterialPageRoute(
                              builder: (context) => CheckOutPage()));
                        },
                        child: CartButton(),
                      ),
                    )
                ),
              ],
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget CartButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_checkout, color: Colors.white),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text('Checkout', style: TextStyle(color: Colors.white))
          ],
        )),
      ),
    );
  }

  Widget CartList() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image(
          image: AssetImage('Assets/s1.png'),
          width: 110,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Samyang', style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Text('Rp ${Count * 21},000', style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          children: [
            Material(
              type: MaterialType.transparency,
              child: IconButton(
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    OrderIncrement();
                  },
                  icon: Icon(Icons.add),
                  color: Colors.white),
            ),
            Text(
              '${Count}',
              style: TextStyle(color: Colors.white),
            ),
            Material(
              type: MaterialType.transparency,
              child: IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {
                  OrderDecrement();
                },
                icon: Icon(Icons.remove, color: Colors.white),
              ),
            )
          ],
        )
      ]),
    );
  }
}
