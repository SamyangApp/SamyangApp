
import 'package:flutter/material.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Setting.dart';

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
  final int _count = 0;

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
              Padding(padding: const EdgeInsets.only(right: 10.0),
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
              const Image(image: AssetImage('Assets/12.png'),height: 50,),
              Padding(padding: const EdgeInsets.only(right: 10.0),
                child: IconButton(
                  onPressed: () { 
                    Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const Settings()
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
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      ),
      body: SafeArea(child: ExamplesWidget()),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}

class ExamplesWidget extends StatelessWidget {

  final ImageList = [
    'Assets/16.png',
    'Assets/17.png',
    'Assets/15.png',
  ];

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          CarouselSlider.builder(
            itemCount: ImageList.length, 
            itemBuilder: (context, index, realIndex) {
              final ImageList2 = ImageList[index];

              return buildimage(ImageList2, index);
            },  options: CarouselOptions(
                    height: 180,
                    aspectRatio: 32/9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                )
          ),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Positioned.fill(
            bottom: 10000,
            child: Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SamyangCheese()));
                },  
                borderRadius: BorderRadius.circular(20),
                child: buildBurger1(),
              ),
              const InkWell(
                child: SizedBox(
                  height: 50,
                  width: 100,
                ),
              ),
              
            ],
          ),)
        ],
      );

  Widget buildBurger1() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: const RadialGradient(
            colors: [
                Color.fromARGB(255, 172, 6, 6),
                Color.fromARGB(255, 0, 0, 0)
              ],
            radius: 1
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color.fromARGB(137, 192, 3, 3),width: 3)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Image(image: AssetImage('Assets/13.png'),width: 160, height: 180,),
            Text(
              'Samyang Cheese',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Samyang Cheese',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Rp.21.000',
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

  Widget BuildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          child:
            const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image(image: AssetImage('Assets/16.png',),width: 380, height: 180,),
            )
        ),
      );
  }

  Widget buildimage(String ImageList, int index) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
        margin: const EdgeInsets.all(5), color: Colors.amber,
        child: Image.asset(
          ImageList,
          fit: BoxFit.cover
        )
    )
  );
}