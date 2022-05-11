import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';

class SamyangCheese extends StatelessWidget {
  late final String Name;
  late final String Url;
  late final String Desc;
  late final int Price;

  SamyangCheese(this.Desc, this.Name, this.Price, this.Url);

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp(   // or CupertinoApp
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
      
      body: ExamplesWidget(Desc, Name, Price, Url),
      backgroundColor: const Color.fromARGB(255, 249, 191, 0),
      ),
    ));
  }
  Widget BuildNavigateButton() => FloatingActionButton(
    child: const Icon(Icons.shopping_cart_outlined),
    onPressed: () {
    },
    backgroundColor: const Color.fromARGB(188, 255, 0, 0),
    );
}

class ExamplesWidget extends StatelessWidget {
  
  late final String Name;
  late final String Url;
  late final String Desc;
  late final int Price;

  ExamplesWidget(this.Desc, this.Name, this.Price, this.Url);

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
            Text(
              Name,
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Text(
              '\nTerjual 140rb++\n',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            SizedBox(height: 8),
            Text(
              'DETAIL PRODUCT\n',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              Desc
              ,style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
