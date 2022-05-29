import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/SpashScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit_Product extends StatefulWidget {
  late final String Name;
  late final int a;
  late final int r;
  late final int g;
  late final int b;
  late final bool isDark;

  Edit_Product(this.Name, this.a, this.r, this.g, this.b, this.isDark,
      {Key? key})
      : super(key: key);

  @override
  State<Edit_Product> createState() =>
      _Edit_ProductState(Name, a, r, g, b, isDark);
}

class _Edit_ProductState extends State<Edit_Product> {
  late final String Name;
  late final int a;
  late final int r;
  late final int g;
  late final int b;
  late final bool isDark;

  _Edit_ProductState(this.Name, this.a, this.r, this.g, this.b, this.isDark);

  late File? _image = null;

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(image!.path);
    setState(() {
      _image = pickedImageFile;
      print('Image Path $_image');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MaterialApp(
          // or CupertinoApp
          title: 'My Flutter App',
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                        alignment: const Alignment(0, 0),
                      )),
                  Image(image: AssetImage('Assets/12.png'), height: 50),
                  Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.transparent,
                        ),
                        alignment: const Alignment(0, 0),
                      )),
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Product_List')
                          .where('Product_Name', isEqualTo: Name)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          print('aaaa');
                          final product = snapshot.data!.docs;
                          print(product);

                          return GridView.builder(
                            itemCount: 1,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 0.2,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return buildBurger1(
                                  product[index]['Product_Img'],
                                  product[index]['Product_Name'],
                                  product[index]['Product_Price'],
                                  product[index]['Product_Desc'],
                                  product[index]['isDark'],
                                  _image);
                            },
                          );
                        } else {
                          print('error');
                          return Text('error');
                        }
                      }),
                )),
                Padding(padding: EdgeInsets.symmetric(horizontal: 0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [BuildNavigateButton1(context)],
                ),
                Padding(
                    padding: EdgeInsets.only(
                  bottom: 10,
                ))
              ],
            ),
            backgroundColor: Color.fromARGB(a, r, g, b),
          ),
        ));
  }

  Widget buildBurger1(
      String Url, String Name, int Price, String Desc, bool isDark, _image) {
    return ClipRRect(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: (_image != null)
                      ? Image.file(
                          _image!,
                          fit: BoxFit.fill,
                        )
                      : Image.network(
                          Url,
                          fit: BoxFit.fitWidth,
                        )),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 2,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.price_change,
                              color: Colors.white,
                            ), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Price \n $Price',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 2,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.price_change,
                              color: Colors.white,
                            ), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Product Name \n $Name',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 18,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.price_change,
                              color: Colors.white,
                            ), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Desc \n $Desc',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(121, 0, 0, 0),
                                  width: 3)),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Icon(
                              Icons.price_change,
                              color: Colors.white,
                            ), // myIcon is a 48px-wide widget.
                          ),
                          hintText: 'Type',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ])
          ],
        ),
      ),
    );
  }

  Widget BuildNavigateButton1(context) => FloatingActionButton.extended(
        heroTag: "btn1",
        label: Text(
          'Edit Product',
          style: TextStyle(fontSize: 15),
        ),
        onPressed: () {},
        backgroundColor: const Color.fromARGB(188, 255, 0, 0),
        icon: Icon(
          Icons.shopping_cart,
          size: 20,
        ),
      );

  void showToast() => Fluttertoast.showToast(msg: 'Product added to cart');

  void showToast2() => Fluttertoast.showToast(msg: 'You need to login first');
}
