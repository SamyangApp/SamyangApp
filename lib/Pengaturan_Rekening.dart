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
            child: Text('Kartu Kredit'),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image(image: AssetImage('Assets/kredit.png')),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text(
                        '321654871',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Text('E-WALLET'),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image(image: AssetImage('Assets/shoppepay.png')),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text(
                        '321654871',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                      ),
                    ))
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image(image: AssetImage('Assets/ovo.png')),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text(
                        '321654871',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Text(
                        '',
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          ),
        ),
        SizedBox(
          height: 200,
        ),
        SizedBox(
          child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.blue.withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return Colors.blue.withOpacity(0.12);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {},
              child: Text('SAVE')),
        )
      ]),
      backgroundColor: Colors.black,
    );
  }
}
