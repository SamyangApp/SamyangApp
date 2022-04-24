import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  runApp(Myapp());
  await Firebase.initializeApp();
  
}

class Myapp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: "persistent navbar",
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: currentIndex == 0 ? Color.fromARGB(255, 14, 0, 0) : Color.fromARGB(255, 0, 0, 0),
        activeColor: currentIndex == 0 ? Color.fromARGB(255, 126, 122, 122) : Colors.black,
        inactiveColor: currentIndex == 0 ? Color.fromARGB(255, 255, 255, 255) : Colors.grey,
        items: const <BottomNavigationBarItem>[
          
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home, size: 20,),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search,size: 20,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart,size: 20,),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person,size: 20,),
            label: 'Account',
          ),
        ],
        ),
        tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder:(context){
              return CupertinoPageScaffold(child: Page1(),);
            });
          case 1:
            return CupertinoTabView(builder:(context){
              return CupertinoPageScaffold(child: Page2(),);
            });
          case 2:
            return CupertinoTabView(builder:(context){
              return CupertinoPageScaffold(child: Page3(),);
            });
          case 3:
            return CupertinoTabView(builder:(context){
              return CupertinoPageScaffold(child: Page4(),);
            });
          default: return CupertinoTabView(builder:(context){
              return CupertinoPageScaffold(child: Page1(),);
            });
        }
      },
    );
  }
}



class Page2 extends StatelessWidget {

 @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            'Hello 2.', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )
          ),
        backgroundColor: Color.fromARGB(255, 3, 0, 0),
    );
  }
}

class Page3 extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            'Hello 3.', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )
          ),
        backgroundColor: Color.fromARGB(255, 3, 0, 0),
    );
  }
}

class Page4 extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            'Hello 4.', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            )
          ),
        backgroundColor: Color.fromARGB(255, 3, 0, 0),
    );
  }
}