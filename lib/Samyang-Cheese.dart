import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/SpashScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SamyangCheese extends StatelessWidget {

  static String obtainedUser = '';
  
  late final String Name;
  late final String Url;
  late final String Desc;
  late final int Price;
  late final int a;
  late final int r;
  late final int g;
  late final int b;
  late final bool isDark;
  late final String ObtainedUserId;

  SamyangCheese(this.Desc, this.Name, this.Price, this.Url, this.a, this.r, this.g, this.b, this.isDark, this.ObtainedUserId);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(   // or CupertinoApp
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.only(right: 1.0),
                child: IconButton(
                  onPressed: () { 
                    Navigator.of(context)
                    .pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 20,                
                    ),
                alignment: const Alignment(0, 0),
                )
              ),
              const Image(image: AssetImage('Assets/12.png'),height: 50,),
              Padding(padding: const EdgeInsets.only(right: 1.0),
                child: IconButton(
                  onPressed: () { 
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Page1()
                    ));
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 20,                
                    ),
                alignment: const Alignment(0, 0),
                )
              ),
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      
      body: Column(
        children: [
          Expanded(child: ExamplesWidget(Desc, Name, Price, Url, isDark)),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BuildNavigateButton2(context),
              SizedBox(
                width: 70,
              ),
              BuildNavigateButton1(context)
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 60,))
        ],
      ),
      backgroundColor: Color.fromARGB(a, r, g, b),
      ),
    ));
  }
  Widget BuildNavigateButton1(context) => FloatingActionButton.extended(
    heroTag: "btn1",
    label: Text('Add to Cart', style: TextStyle(fontSize: 15),),
    onPressed: () {
      if (ObtainedUserId == 'null') {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenPage()));
        showToast2();
        print('null ege');
      } else if (ObtainedUserId != 'null') {
        CreateCart(name: Name);
        showToast();
        print('aa');
        print(ObtainedUserId);
        
      }
    },
    backgroundColor: const Color.fromARGB(188, 255, 0, 0),
    icon: Icon(Icons.shopping_cart, size: 20,),
    );
  Widget BuildNavigateButton2(context) => FloatingActionButton.extended(
    heroTag: "btn2",
    label: Text('Buy Now', style: TextStyle(fontSize: 18)),
    onPressed: () {
    },
    backgroundColor: const Color.fromARGB(188, 255, 0, 0),
    elevation: 1000,
    icon: Icon(Icons.shopping_cart, size: 28),
    );
    
  void showToast() => Fluttertoast.showToast(
    msg: 'Product added to cart');

  void showToast2() => Fluttertoast.showToast(
    msg: 'You need to login first');

  Future CreateCart({required String name}) async {
     SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedUser = sharedPreferences.getString('Userid');
    print(obtainedUser);
    final docCart = FirebaseFirestore.instance.collection('Cart').doc(obtainedUser).collection('UserCart').doc(name);

    final json = {
      'ProductName': name,
      'Count' : 1,
      'Product_Img' : Url,
      'ProductPrice' : Price,
      'id' : obtainedUser,
      'TotalPrice' : Price
    };
    await docCart.set(json);
  }
}

class ExamplesWidget extends StatelessWidget {
  
  late final String Name;
  late final String Url;
  late final String Desc;
  late final int Price;
  late final bool isDark;
  late final Color fontColor;

  ExamplesWidget(this.Desc, this.Name, this.Price, this.Url, this.isDark);

  
  @override

  Widget build(BuildContext context) {
    if (isDark != true) {
    fontColor = Colors.black;
    } else {
      fontColor = Colors.white;
    }

    return ListView(
        children: [
         buildBurger1(),
        ],
      );
  }
  
  Widget buildBurger1() {
    return ClipRRect(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(Url),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                'Rp.${Price}',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                  fontSize: 30
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30,              
                    color: fontColor, 
                    ),
                alignment: const Alignment(0, 0),
                )
              ],
            ),
            Text(
              Name,
              style: TextStyle(color: fontColor, fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              '\nTerjual 140rb++\n',
              style: TextStyle(color: fontColor, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              'DETAIL PRODUCT\n',
              style: TextStyle(color: fontColor, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              Desc
              ,style: TextStyle(color: fontColor, fontSize: 15, fontWeight: FontWeight.w400)),
            
          ],
        ),
      ),
    );
  }
}