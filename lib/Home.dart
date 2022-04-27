import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter_application_1/Samyang-Cheese.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:flutter_application_1/Setting.dart';
import 'package:flutter_application_1/Icons.dart';
import 'package:flutter_application_1/List.dart';

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
                    .push(MaterialPageRoute(builder: (context) => Settings()
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
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                )
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Wrap(
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
            ],
          ),
        ],
      );

  Widget buildBurger1() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(126, 104, 2, 2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromARGB(122, 247, 5, 5),width: 3)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage('Assets/13.png'),width: 160, height: 180,),
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

  Widget BuildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          child:
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image(image: AssetImage('Assets/16.png',),width: 380, height: 180,),
            )
        ),
      );
  }

  Widget buildimage(String ImageList, int index) => ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
        margin: EdgeInsets.all(5), color: Colors.amber,
        child: Image.asset(
          ImageList,
          fit: BoxFit.cover
        )
    )
  );
}