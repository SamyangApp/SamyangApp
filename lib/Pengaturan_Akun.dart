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
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: Center(
        child: Column(children: [
          SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Container(
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
                  child: Padding(
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
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 150,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
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
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }
}
