import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/History.dart';
import 'package:flutter_application_1/Pengaturan_Akun.dart';
import 'package:flutter_application_1/Pengaturan_Rekening.dart';
import 'package:flutter_application_1/Daftar_Alamat.dart';

class Settings extends StatefulWidget {
  late User user;

  Settings(this.user, {Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState(user);
}

class _SettingsState extends State<Settings> {
  late User user;

  _SettingsState(this.user);

  final ImageList = [
    'Assets/s1.png',
    'Assets/s2.png',
    'Assets/s3.png',
  ];

  final ItemList = [
    'Samyang 1',
    'Samyang 2',
    'Samyang 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('My Account'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 120,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('User')
                      .doc(user.uid)
                      .collection('UserList')
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasData) {
                      print('aaaa');
                      final User = snapshot.data!.docs;
                      print(User);

                      return GridView.builder(
                        itemCount: 1,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 4,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return BuildUser(
                            User[index]['img'],
                            User[index]['Username'],
                            User[index]['Email'],
                            User[index]['Pnum'],
                          );
                        },
                      );
                    } else {
                      print('error');
                      return Text('error');
                    }
                  }),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Container(
              child: CarouselSlider.builder(
                  itemCount: ImageList.length,
                  itemBuilder: (context, index, realindex) {
                    final ImageList2 = ImageList[index];
                    final ItemList2 = ItemList[index];

                    return BuildImage(ImageList2, ItemList2, index);
                  },
                  options: CarouselOptions(
                    height: 100,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 1,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 70,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AturAkun(user)));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      Row(
                        children: [
                          const Icon(
                            Icons.person,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Pengaturan Akun',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 2)),
                              Text('Atur Akun, Username, Password',
                                  style: TextStyle(color: Colors.white)),
                              Padding(padding: EdgeInsets.all(2)),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 70,
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AturRekening()));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      Row(
                        children: [
                          const Icon(
                            Icons.credit_card,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Pengaturan Rekening',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 2)),
                              Text('Atur Rekening Pembayaran Belanjaan',
                                  style: TextStyle(color: Colors.white)),
                              Padding(padding: EdgeInsets.all(2)),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 70,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Alamat(user)));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      Row(
                        children: [
                          const Icon(
                            Icons.house_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Daftar Alamat',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 2)),
                              Text('Atur Alamat Pengiriman Belanjaan',
                                  style: TextStyle(color: Colors.white)),
                              Padding(padding: EdgeInsets.all(2)),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            SizedBox(
              height: 70,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => History(user)));
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(padding: EdgeInsets.all(5)),
                      Row(
                        children: [
                          const Icon(
                            Icons.history,
                            size: 30,
                            color: Colors.white,
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('Histori Belanja',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17)),
                              Padding(
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 2)),
                              Text('Histori pembelanjaan mu',
                                  style: TextStyle(color: Colors.white)),
                              Padding(padding: EdgeInsets.all(2)),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget BuildUser(String url, String Username, String Email, String Pnum) {
    return Row(
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        CircleAvatar(
            backgroundColor: Color.fromARGB(255, 243, 33, 33),
            radius: 45,
            child: SizedBox(
                width: 85,
                height: 85,
                child: ClipOval(
                  child: Image.network(url),
                ))),
        Padding(padding: EdgeInsets.all(10)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(bottom: 4)),
            Text(Username,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white)),
            Text(Pnum, style: TextStyle(fontSize: 15, color: Colors.white)),
            Text(Email, style: TextStyle(fontSize: 15, color: Colors.white)),
            Padding(padding: EdgeInsets.only(top: 4, bottom: 4)),
          ],
        ),
      ],
    );
  }

  Widget BuildImage(String ImageList, String ItemList, int index) => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          width: 350,
          margin: const EdgeInsets.all(5),
          color: const Color.fromARGB(26, 255, 255, 255),
          child: Row(
            children: [
              Image.asset(ImageList, fit: BoxFit.cover),
              const Padding(padding: EdgeInsets.all(10)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(ItemList, style: const TextStyle(color: Colors.white)),
                  const Padding(padding: EdgeInsets.all(5)),
                  Text(
                    ItemList,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          )));
}
