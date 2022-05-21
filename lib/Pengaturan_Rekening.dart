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
              child: Text('Pengaturan Rekening'),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: Column(children: [
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Text(
              'Kartu Kredit',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 219, 176, 173)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('Assets/kredit.png'),
                ),
                Text(
                  '321654871',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            // height: 20,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Text(
                  'E-WALLET',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 219, 176, 173)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('Assets/shoppepay.png'),
                ),
                Text(
                  '321654871',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 219, 176, 173)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('Assets/ovo.png'),
                ),
                Text(
                  '321654871',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '',
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 200),
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
                    'SAVE',
                    style: TextStyle(fontSize: 24),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }
}
