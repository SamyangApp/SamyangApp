import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'My Account'
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 5.0),
                child: IconButton(
                  onPressed: () { 
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Settings()
                    ));
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 20,                
                    ),
                alignment: Alignment(0, 0),
                )
              ),
            ],
          ),
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.all(5)),
            Container(
              height: 120,
              child: Row(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 45,
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: ClipOval(
                        child: Image.asset("Assets/10.png",
                      ),
                    )
                  )
                ),
                Padding(padding: EdgeInsets.all(10)),
                Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 4)),
                  Text('Username', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                  Text('+08129299188',style:TextStyle(fontSize: 15, color: Colors.white)),
                  Text('Username@gmail.com',style:TextStyle(fontSize: 15, color: Colors.white)),
                  Padding(padding: EdgeInsets.only(top: 4, bottom: 4)),
                ],
              ),
              ],
            ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text('Pengaturan Akun',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              height: 70 ,
              child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(10),
                child : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    size:30,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Pengaturan Akun',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17)),
                                      Padding(padding: EdgeInsets.only(left: 10, bottom: 2)),
                                      Text('Atur Akun, Username, Password',style: TextStyle(color: Colors.white)),
                                      Padding(padding: EdgeInsets.all(2)),
                                    ],
                                  )
                                ],
                            ),
                          ],
                        )  
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
              height: 70 ,
              child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(10),
                child : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Row(
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    size:30,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Pengaturan Rekening',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17)),
                                      Padding(padding: EdgeInsets.only(left: 10, bottom: 2)),
                                      Text('Atur Rekening Pembayaran Belanjaan',style: TextStyle(color: Colors.white)),
                                      Padding(padding: EdgeInsets.all(2)),
                                    ],
                                  )
                                ],
                            ),
                          ],
                        )  
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
              height: 70 ,
              child: InkWell(
                onTap: (){},
                borderRadius: BorderRadius.circular(10),
                child : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            Row(
                                children: [
                                  Icon(
                                    Icons.house_rounded,
                                    size:30,
                                    color: Colors.white,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Daftar Alamat',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17)),
                                      Padding(padding: EdgeInsets.only(left: 10, bottom: 2)),
                                      Text('Atur Alamat Pengiriman Belanjaan',style: TextStyle(color: Colors.white)),
                                      Padding(padding: EdgeInsets.all(2)),
                                    ],
                                  )
                                ],
                            ),
                          ],
                        )  
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              
            ],
          ),
      backgroundColor: Colors.black,
      );
  }
}