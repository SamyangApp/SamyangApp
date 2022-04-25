import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";

class SamyangCheese extends StatelessWidget {

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // or CupertinoApp
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(right: 1.0),
                child: IconButton(
                  onPressed: () { 
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Page1()
                    ));
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,                
                    ),
                alignment: Alignment(0, 0),
                )
              ),
              Image(image: AssetImage('Assets/12.png'),height: 50,),
              Padding(padding: EdgeInsets.only(right: 1.0),
                child: IconButton(
                  onPressed: () { 
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Page1()
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
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: ExamplesWidget(),
      backgroundColor: Color.fromARGB(255, 249, 191, 0),
      ),
    );
  }
}

class ExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
        children: [
         buildBurger1()
        ],
      );

  Widget buildBurger1() {
    return ClipRRect(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(image: AssetImage('Assets/13.png'),height: 350,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                '\Rp.21.000',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,                
                    ),
                alignment: Alignment(0, 0),
                )
              ],
            ),
            Text(
              'Buldak Bokkeummyeon Cheese 140 gr',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 8),
            
          ],
          
        ),
      ),
    );
  }
}