import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/BCA.dart';
import 'package:flutter_application_1/BRI.dart';
import 'package:flutter_application_1/BNI.dart';
import 'package:flutter_application_1/Cart.dart';

class CheckOutPage extends StatelessWidget {
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
  int BankPointer = 0;

  final String Bank = '';

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

  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Flutter App',
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 117, 11, 3),
          ], radius: 2)),
          child: Scaffold(
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
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Cart()));
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
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            body: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    ListAddres(),
                    Padding(padding: EdgeInsets.all(8)),
                    CartList(),
                    CartList(),
                    CartList(),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Container(
                      child: ExpansiveList(),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20, left: 5)),
                    Container(
                      width: 350,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Subtotal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            'Rp 21.000',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 95,
                    )
                  ],
                )
              ],
            ),
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
          ),
        ));
  }

  Widget ExpansiveList() {
    return ListTileTheme(
        child: ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Text(
        'Pilihan Pembayaran',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      children: [
        Padding(padding: EdgeInsets.only(bottom: 8)),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Colors.black.withOpacity(0.3)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BCAPage()));
            BankListBCA();
            print(BankPointer);
          },
          child: BCAExpandedList(),
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Colors.black.withOpacity(0.3)),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => BRIPage()));
            BankListBNI();
            print(BankPointer);
          },
          child: BRIExpandedList(),
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Colors.black.withOpacity(0.3)),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => BNIPage()));
            BankListBRI();
            print(BankPointer);
          },
          child: BNIExpandedList(),
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
      ],
    ));
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

  Widget ListAddres() {
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
              Text('Hane Kawa', style: TextStyle(color: Colors.white)),
              Text('(081297723819)', style: TextStyle(color: Colors.white))
            ],
          ),
          Container(
            child: new Container(
              padding: new EdgeInsets.only(right: 13.0),
              width: 380,
              child: new Text(
                  'Jalan Isekai 10 Blok Z10 No 1, Pegadungan, Jakarta Barat, DKI Jakarta',
                  maxLines: 10,
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget CartList() {
    return Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          width: 400,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(64, 255, 255, 255)),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
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
                    Text('Rp 21,000', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Text('x1', style: TextStyle(color: Colors.white))
              ]),
        ));
  }
}
