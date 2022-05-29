import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CartSplashScreen.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/BCA.dart';
import 'package:flutter_application_1/BRI.dart';
import 'package:flutter_application_1/BNI.dart';
import 'package:flutter_application_1/Cart.dart';
import 'package:flutter_application_1/PaymentList.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutPage extends StatelessWidget {
  late User user;
  late String ad;

  CheckOutPage(this.user, this.ad);

  static String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(user, ad),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  late User user;
  late String ad;

  MyStatefulWidget(this.user, this.ad, {Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(user, ad);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late User user;
  late String ad;
  int BankPointer = 0;
  static String obtainedUser = '';
  final String Bank = '';

  _MyStatefulWidgetState(this.user, this.ad);

  @override
  void BankListBCA() {
    setState(() {
      BankPointer = 1;
    });
  }

  void BankListBNI() {
    setState(() {
      BankPointer = 2;
    });
  }

  void BankListBRI() {
    setState(() {
      BankPointer = 3;
    });
  }

  void BankLisTCOD() {
    setState(() {
      BankPointer = 4;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 1.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CartSplashScreenPage()));
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                  alignment: const Alignment(0, 0),
                )),
            Text('Checkout')
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
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              Padding(padding: EdgeInsets.all(5)),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('User')
                      .doc(user.uid)
                      .collection('AddresList')
                      .where('UidAddres', isEqualTo: ad.toString())
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      print('aaaa');
                      final User = snapshot.data!.docs;
                      print(User);

                      return GridView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 5,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ListAddres(
                            User[index]['AddresName'],
                            User[index]['Fname'],
                            User[index]['Lname'],
                            User[index]['Pnum'],
                            User[index]['Addres'],
                          );
                        },
                      );
                    } else {
                      print('error');
                      return Text('error');
                    }
                  }),
              Padding(padding: EdgeInsets.all(5)),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
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
                            return CartList(
                                product[index]['Product_Img'],
                                product[index]['ProductName'],
                                product[index]['ProductPrice'],
                                product[index]['Count']);
                          },
                        );
                      } else if (snapshot.hasError) {
                        print('error');
                        return Text('error');
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              Container(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Cart')
                          .doc(user.uid)
                          .collection('UserCart')
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          var ds = snapshot.data!.docs;
                          num sum = 0;
                          for (int i = 0; i < ds.length; i++)
                            sum += (ds[i]['TotalPrice']);
                          return (TotalPriceTab(sum));
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      })),
              Padding(padding: EdgeInsets.all(10)),
              SizedBox(
                height: 70,
              )
            ],
          )),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget TotalPriceTab(num Pricetotal) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Belanja',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text('${Pricetotal}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold))
                ],
              )),
          Container(
              width: 160,
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(183, 87, 3, 3),
                  ),
                  onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentList(Pricetotal, user)));
                        },
                  child: CartButton(),
                ),
              )),
        ],
      ),
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
                Padding(padding: EdgeInsets.only(left: 20)),
                Text('Payment', style: TextStyle(color: Colors.white)),
              ],
            )),
      ),
    );
  }

  Widget ListAddres(String AddressName, String Fname, String Lname, String Pnum,
      String Address) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat Pengiriman',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              Text('$Fname $Lname', style: TextStyle(color: Colors.white)),
              Text('($Pnum)', style: TextStyle(color: Colors.white))
            ],
          ),
          Container(
            child: new Container(
              padding: new EdgeInsets.only(right: 13.0),
              width: 380,
              child: new Text(Address,
                  maxLines: 10, style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget CartList(String url, String name, int price, int Count) {
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: 400,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(120, 233, 110, 110)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.network(
                  url,
                  width: 110,
                ),
                Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(name,
                          style: TextStyle(color: Colors.white),
                          maxLines: 3,
                          textAlign: TextAlign.center),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Text('Rp ${price}',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text('x ${Count}', style: TextStyle(color: Colors.white))
              ]),
        ));
  }
}
