import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';

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
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   // or CupertinoApp
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: BuildNavigateButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
                    .push(MaterialPageRoute(builder: (context) => Page1()
                    ));
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
      
      body: ExamplesWidget(),
      backgroundColor: const Color.fromARGB(255, 249, 191, 0),
      ),
    );
  }
  Widget BuildNavigateButton() => FloatingActionButton(
    child: const Icon(Icons.shopping_cart_outlined),
    onPressed: () {
    },
    backgroundColor: const Color.fromARGB(188, 255, 0, 0),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Image(image: AssetImage('Assets/13.png'),height: 350,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                'Rp.21.000',
                  style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 30,                
                    ),
                alignment: const Alignment(0, 0),
                )
              ],
            ),
            const Text(
              'Buldak Bokkeummyeon Cheese 140 gr',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
            ),
            const Text(
              '\nTerjual 140rb++\n',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            const SizedBox(height: 8),
             const Text(
              'DETAIL PRODUCT\n',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Samyang Buldak Bokkeummyeon Cheese \nVery hot and Spicy Ramen with Chicken flavour.\nMultipack 4 x 140g.\nDirection (1 serving): Add the noodles in 600ml of boiling water and boil for 5 minutes. Then drain the water, leave only 100 ml in the pot. Add the liquid spices and stir. Then add the spice flakes and stir again.\n\nGet quantity discount!\n\nIngredients:\nIngredients: wheat flour, palm oil, salt, citric acid, cheese sauce, soy sauce, sugar, chicken powder, soybeans, onion, pepper powder, garlic, starch, cheese.\n\nNetto:140g\n\nProduct of Korea\n\nNutritional information per serving 140g\nEnergy 2301kJ/550kcal\nFat 18g \nSaturated fat 9g\nCarbonhydrates 84g\nSugar 7,0g\nProtein	13g\nSalt	1,4g'
              ,style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}

