import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CartSplashScreen.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/BCA.dart';
import 'package:flutter_application_1/BRI.dart';
import 'package:flutter_application_1/BNI.dart';
import 'package:flutter_application_1/Cart.dart';
import 'package:flutter_application_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentList extends StatelessWidget {
  late num PriceTotal;
 late User user;

  PaymentList(this.PriceTotal, this.user);

  static String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(PriceTotal, user),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  late User user;
  late num PriceTotal;

  MyStatefulWidget(this.PriceTotal, this.user, {Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState(PriceTotal, user);
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int BankPointer = 0;
  static String obtainedUser = '';
  final String Bank = '';
  late num PriceTotal;
  late User user;

  _MyStatefulWidgetState(this.PriceTotal, this.user);

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

  addhistory(num pricetotal) async {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    String datenow = '${now.day}-${now.month}-${now.year}';
    String HourNow = '${now.hour}:${now.minute}:${now.second}:${now.millisecond}';

    print(datenow);
    print(pricetotal);

    final History = FirebaseFirestore.instance
                    .collection('History')
                    .doc(user.uid)
                    .collection('UserHistory')
                    .doc();

    final json = ({
      'date' : datenow,
      'Hour' : HourNow,
      'Price' : pricetotal
    });

    History.set(json);

    await FirebaseFirestore.instance
                    .collection('Cart')
                    .doc(user.uid)
                    .collection('UserCart')
                    .get()
                    .then((value) {
                      value.docs.forEach((element) {
                        element.reference.delete();
                       });
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
              Container(
                height: MediaQuery.of(context).size.height - 106,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    VAList(),
                    CODList(),
                    CashlessList(),
                    SizedBox(
                      height: 100,
                    )
                  ],
                )
              ),
            ],
          )),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget TotalPriceTab(num Pricetotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.only(left: 10)),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Belanja',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            Padding(padding: EdgeInsets.only(left: 20)),
            Text('${Pricetotal}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              width: 0,
            ),
          ],
        )),
      ],
    );
  }

  Widget VAList() {
    return ListTileTheme(
      child: Column(
        children: [
          ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: Text(
                'Bank Virtual Account',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.3)),
                  onPressed: () async {
                    await addhistory(PriceTotal);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BCAPage()));
                    BankListBCA();
                    print(BankPointer);
                  },
                  child: BCAExpandedList(),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.3)),
                  onPressed: () async {
                    await addhistory(PriceTotal);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BRIPage()));
                    BankListBNI();
                    print(BankPointer);
                  },
                  child: BRIExpandedList(),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.3)),
                  onPressed: () async {
                    await addhistory(PriceTotal);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BNIPage()));
                    BankListBRI();
                    print(BankPointer);
                  },
                  child: BNIExpandedList(),
                ),
              ])
        ],
      ),
    );
  }

  Widget CODList() {
    return ListTileTheme(
      child: Column(
        children: [
          ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: Text(
                'Cash On Delivery (COD)',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.3)),
                  onPressed: () async {
                    await addhistory(PriceTotal);
                    //Navigator.push(context,
                        //MaterialPageRoute(builder: (context) => MyApp()));
                    BankLisTCOD();
                    print(BankPointer);
                  },
                  child: CODExpandedList(),
                )
              ])
        ],
      ),
    );
  }

  Widget CashlessList() {
    return ListTileTheme(
      child: Column(
        children: [
          ExpansionTile(
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: Text(
                'Cashless / E-Wallet',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.3)),
                  onPressed: () async {
                    await addhistory(PriceTotal);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                    BankLisTCOD();
                    print(BankPointer);
                  },
                  child: OVOExpandedList(),
                ),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black.withOpacity(0.3)),
                  onPressed: () async {
                    await addhistory(PriceTotal);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                    BankLisTCOD();
                    print(BankPointer);
                  },
                  child: ShopeePayExpandedList(),
                )
              ])
        ],
      ),
    );
  }

  Widget OVOExpandedList() {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage('Assets/ovo.png'), width: 80),
          Text('Pembayaran via Cashless OVO payment', maxLines: 10)
        ],
      ),
    );
  }

  Widget ShopeePayExpandedList() {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: [
          Image(image: AssetImage('Assets/shoppepay.png'), width: 80),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text('Pembayaran via Cashless Shopee Pay \npayment', maxLines: 10)
        ],
      ),
    );
  }

  Widget CODExpandedList() {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage('Assets/B9.png'), width: 80),
          Text('Pembayaran via Cash On Delivery', maxLines: 10)
        ],
      ),
    );
  }

  Widget BCAExpandedList() {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage('Assets/B3.png'), width: 80),
          Text('Pembayaran via BCA virtual account', maxLines: 10)
        ],
      ),
    );
  }

  Widget BNIExpandedList() {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage('Assets/B2.png'), width: 80),
          Text('Pembayaran via BNI virtual account', maxLines: 10)
        ],
      ),
    );
  }

  Widget BRIExpandedList() {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: AssetImage('Assets/B1.png'), width: 80),
          Text('Pembayaran via BRI virtual account', maxLines: 10)
        ],
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
