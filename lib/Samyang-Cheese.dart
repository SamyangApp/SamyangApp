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
      floatingActionButton: BuildNavigateButton(),
      body: ExamplesWidget(),
      backgroundColor: Color.fromARGB(255, 249, 191, 0),
      ),
    );
  }
  Widget BuildNavigateButton() => FloatingActionButton(
    child: Icon(Icons.shopping_cart_outlined),
    onPressed: () {
      print('pressed');
    },
    backgroundColor: Color.fromARGB(188, 255, 0, 0),
    );
}

class ExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView(
        children: [
         buildBurger1(),
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
            Text(
              '\nTerjual 140rb++\n',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            const SizedBox(height: 8),
             Text(
              'DETAIL PRODUCT\n',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              'Samyang Buldak Bokkeummyeon Cheese \nVery hot and Spicy Ramen with Chicken flavour.\nMultipack 4 x 140g.\nDirection (1 serving): Add the noodles in 600ml of boiling water and boil for 5 minutes. Then drain the water, leave only 100 ml in the pot. Add the liquid spices and stir. Then add the spice flakes and stir again.\n\nGet quantity discount!\n\nIngredients:\nIngredients: wheat flour, palm oil, salt, citric acid, cheese sauce, soy sauce, sugar, chicken powder, soybeans, onion, pepper powder, garlic, starch, cheese.\n\nNetto:140g\n\nProduct of Korea\n\nNutritional information per serving 140g\nEnergy 2301kJ/550kcal\nFat 18g \nSaturated fat 9g\nCarbonhydrates 84g\nSugar 7,0g\nProtein	13g\nSalt	1,4g'
              ,style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}

