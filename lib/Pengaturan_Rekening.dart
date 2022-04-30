import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AturRekening extends StatefulWidget {
  AturRekening({Key? key}) : super(key: key);

  @override
  State<AturRekening> createState() => _nameState();
}

class _nameState extends State<AturRekening> {
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
      body: Center(child: Row()),
      backgroundColor: Colors.black,
    );
  }
}
