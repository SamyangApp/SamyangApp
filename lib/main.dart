import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/List.dart';
import 'package:flutter_application_1/Samyang-Cheese.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int currenIndex = 0;
  final List<Widget> screens = [
    Page1(),
    SamyangCheese(),
    Page1(),
    Page1(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = Page1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageStorage(
        bucket: bucket, 
        child: currentscreen),
      floatingActionButton: BuildNavigateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
    
     bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 14, 0, 0),
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        
                        setState(() {
                          currentscreen = Page1();
                          currenIndex = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.house_outlined,
                            color: currenIndex == 0 ? Colors.white : Colors.grey
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currenIndex == 0 ? Colors.white : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        
                        setState(() {
                          currentscreen = SamyangCheese();
                          currenIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.house_outlined,
                            color: currenIndex == 1 ? Colors.white : Colors.grey
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currenIndex == 1 ? Colors.white : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 40)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        
                        setState(() {
                          currentscreen = Page1();
                          currenIndex = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.house_outlined,
                            color: currenIndex == 2 ? Colors.white : Colors.grey
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currenIndex == 2 ? Colors.white : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        
                        setState(() {
                          currentscreen = LoginPage();
                          currenIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.house_outlined,
                            color: currenIndex == 3 ? Colors.white : Colors.grey
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                              color: currenIndex == 3 ? Colors.white : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ),
    );
  }

  Widget BuildNavigateButton() => Container(
      width: 85,
      height: 85,
      child: FloatingActionButton(
        child: Image(image: AssetImage('Assets/18.png')),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ListSamyang()));
        },
        backgroundColor: Color.fromARGB(161, 255, 0, 0),
      ));
}
