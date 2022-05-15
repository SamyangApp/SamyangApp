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
              child: Text('Pengaturan Akun'),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: Center(
        child: Column(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 160,
                  height: 160,
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 310,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 204, 0, 0),
                        hintText: 'Username'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 310,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 204, 0, 0),
                        hintText: 'Email'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 310,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 204, 0, 0),
                        hintText: 'No. Telephone'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 310,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 204, 0, 0),
                        hintText: 'Address'),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide(width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(121, 5, 177, 48),
                                width: 3)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 10, 233, 66),
                        hintText: 'SAVE'),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      backgroundColor: Colors.black,
    );
  }
}
