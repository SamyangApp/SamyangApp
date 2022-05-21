import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alamat extends StatefulWidget {
  Alamat({Key? key}) : super(key: key);

  @override
  State<Alamat> createState() => _nameState();
}

class _nameState extends State<Alamat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Text(
                'Pengaturan Alamat',
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        //rumah
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 300, bottom: 160),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 50,
                              // width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Rumah',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        //nama
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 0, bottom: 110),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 50,
                              // width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Anita Fajri',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //alamat
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              // height: 50,
                              // width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Jalan Raya Danau Maninjau Nomor 15 RT 01 RW 05, Kelurahan Gedangan, Kecamatan Magersari Kota Mojokerto',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //ubah alamat
                        Padding(
                          padding:
                              EdgeInsets.only(top: 160, left: 20, right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 18, 158, 0),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  onPressed: () {
                                    // AuthServices.SignIn(user.text, pass.text);
                                  },
                                  child: const Text(
                                    'Ubah Alamat',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                        //rumah
                        Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 300, bottom: 160),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 50,
                              // width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Rumah',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        //nama
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 0, bottom: 110),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 50,
                              // width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Anita Fajri',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //alamat
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              // height: 50,
                              // width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  'Jalan Raya Danau Maninjau Nomor 15 RT 01 RW 05, Kelurahan Gedangan, Kecamatan Magersari Kota Mojokerto',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //ubah alamat
                        Padding(
                          padding:
                              EdgeInsets.only(top: 160, left: 20, right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 18, 158, 0),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    minimumSize: const Size.fromHeight(50),
                                  ),
                                  onPressed: () {
                                    // AuthServices.SignIn(user.text, pass.text);
                                  },
                                  child: const Text(
                                    'Ubah Alamat',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }
}
