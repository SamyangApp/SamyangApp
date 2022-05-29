import 'package:flutter/material.dart';
import 'package:flutter_application_1/CartSplashScreen.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Product_List_Screen/Product_List.dart';
import 'package:flutter_application_1/SettingSplashScreen.dart';
import 'package:flutter_application_1/SpashScreen.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
   return StreamProvider.value(
     value: AuthServices.firebaseUserStream, 
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
   ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  late bool isLoading;

  @override
  int currenIndex = 0;
  List<Widget> screens = [
    Page1(),
    SplashScreenPageSetting(),
    Product_List(),
    CartSplashScreenPage(),
    SplashScreenPage(),
  ];

  PageStorageBucket bucket = PageStorageBucket();
  Widget currentscreen = Page1();

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom==0.0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket, 
        child: currentscreen),
      floatingActionButton: BuildNavigateButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
       bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(178, 14, 0, 0),
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 55,
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
                          currentscreen = SplashScreenPageSetting();
                          currenIndex = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: currenIndex == 1 ? Colors.white : Colors.grey
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: currenIndex == 1 ? Colors.white : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(left: 66)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        
                        setState(() {
                          currentscreen = CartSplashScreenPage();
                          currenIndex = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: currenIndex == 3 ? Colors.white : Colors.grey
                          ),
                          Text(
                            'Cart',
                            style: TextStyle(
                              color: currenIndex == 3 ? Colors.white : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Padding(padding: EdgeInsets.only(right: 8)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      minWidth: 40,
                      onPressed: () {
                        
                        setState(() {
                          currentscreen = SplashScreenPage();
                          currenIndex = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currenIndex == 4 ? Colors.white : Colors.grey
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                              color: currenIndex == 4 ? Colors.white : Colors.grey,
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

  Widget BuildNavigateButton() => SizedBox(
      width: 75,
      height: 75,
      child: FloatingActionButton(
        child: const Image(image: AssetImage('Assets/18.png')),
        onPressed: () {
          setState(() {
            currentscreen = Product_List();
            currenIndex = 2;
          });
        },
        backgroundColor: const Color.fromARGB(161, 255, 0, 0),
      ));
}
