import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AturAkun extends StatefulWidget {
  AturAkun({Key? key}) : super(key: key);

  @override
  State<AturAkun> createState() => _nameState();
}

class _nameState extends State<AturAkun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Text('Pengaturan Akun'),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(0, 255, 0, 0),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 189, 4, 4),
            Color.fromARGB(255, 107, 10, 3),
            Color.fromARGB(255, 34, 3, 1),
            Color.fromARGB(255, 117, 11, 3),
            Color.fromARGB(255, 185, 3, 3),
          ],
        )),
        child: Center(
          child: Column(children: [
            SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10),
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1599566150163-29194dcaad36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                        color: Color(0xFFe0f2f1)),
                  ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 310,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color:  Color.fromARGB(122, 247, 5, 5),
                                  width: 3)),
                          filled: true,
                          fillColor: Color.fromARGB(0, 0, 0, 0),
                          hintText: 'Username', hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 310,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color:  Color.fromARGB(122, 247, 5, 5),
                                  width: 3)),
                          filled: true,
                          fillColor: Color.fromARGB(0, 0, 0, 0),
                          hintText: 'Email', hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 310,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color:  Color.fromARGB(122, 247, 5, 5),
                                  width: 3)),
                          filled: true,
                          fillColor: Color.fromARGB(0, 0, 0, 0),
                          hintText: 'No. Telepon', hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
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
                              onPressed: () {},
                              child: const Text(
                                'Save',
                                style: TextStyle(fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
      backgroundColor: Color.fromARGB(0, 39, 1, 1),
    );
  }
}
