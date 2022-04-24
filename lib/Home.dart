import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart'; 

class Page1 extends StatelessWidget {

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
              Padding(padding: EdgeInsets.only(right: 10.0),
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
              Image(image: AssetImage('Assets/12.png'),height: 50,),
              Padding(padding: EdgeInsets.only(right: 10.0),
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
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      body: ExamplesWidget(),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class ExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        children: [
          buildRow1(),
          buildRow2(),
        ],
      );

  Widget buildRow1() => Column(
    children: [
      const SizedBox(height: 16),
      buildBurgers1(),
    ],
  );

  Widget buildRow2() => Column(
    children: [
      const SizedBox(height: 16),
      buildBurgers2(),
    ],
  );

  Widget buildBurgers1() => Row(
        children: [
          Expanded(child: buildBurger1()),
          const SizedBox(width: 12),
          Expanded(child: buildBurger2()),
        ],
      );
  
   Widget buildBurgers2() => Row(
        children: [
          Expanded(child: buildBurger3()),
          const SizedBox(width: 12),
          Expanded(child: buildBurger4()),
        ],
      );

  Widget buildBurger1() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color.fromARGB(122, 247, 5, 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage('Assets/13.png'),height: 200,),
            Text(
              'Samyang Cheese',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Samyang Cheese',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\Rp.21.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBurger2() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color.fromARGB(122, 247, 5, 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage('Assets/14.png'),height: 200,),
            Text(
              'Samyang Cheese',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Samyang Cheese',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\Rp.21.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBurger3() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color.fromARGB(122, 247, 5, 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage('Assets/13.png'),height: 200,),
            Text(
              'Samyang Cheese',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Samyang Cheese',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\Rp.21.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBurger4() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(12),
        color: Color.fromARGB(122, 247, 5, 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage('Assets/14.png'),height: 200,),
            Text(
              'Samyang Cheese',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Samyang Cheese',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              '\Rp.21.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}