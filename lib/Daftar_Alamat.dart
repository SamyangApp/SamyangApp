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
      floatingActionButton: BuildNavigateButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  ListAlamat(),
                  ListAlamat(),

                ],
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget ListAlamat() {
    return Padding(
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
                    border: Border.all(
                        color: Color.fromARGB(137, 192, 3, 3),
                        width: 1.0,
                        style: BorderStyle.solid), //Border.all
                    /*** The BorderRadius widget  is here ***/
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    gradient: const RadialGradient(colors: [
                      Color.fromARGB(255, 172, 6, 6),
                      Color.fromARGB(255, 0, 0, 0),
                      Color.fromARGB(255, 0, 0, 0)
                    ], radius: 1.6)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, bottom: 180),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text(
                        'Rumah',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    )),
              ),
            ),
            //nama
            Padding(
              padding: EdgeInsets.only(left: 10, right: 0, bottom: 110),
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
                          fontSize: 22,
                          color: Colors.white),
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
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            //ubah alamat
            Padding(
              padding: EdgeInsets.only(top: 160, left: 20, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 255, 0, 0),
                              Color.fromARGB(255, 134, 11, 11),
                              Color.fromARGB(255, 88, 3, 3),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () async {},
                      child: const Text(
                        'Ubah Alamat',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
  
  Widget BuildNavigateButton(context) => FloatingActionButton.extended(
    heroTag: "btn2",
    label: Text('Tambah Alamat', style: TextStyle(fontSize: 18)),
    onPressed: () {},
    backgroundColor: Color.fromARGB(187, 160, 7, 7),
    elevation: 1000,
    icon: Icon(Icons.add, size: 28),
    );
}
