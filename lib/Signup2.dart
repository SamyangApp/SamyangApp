import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:flutter_application_1/header_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_application_1/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int Count = 0;
  bool checkboxValue = false;

  TextEditingController Addres = new TextEditingController();
  TextEditingController Fname = new TextEditingController();
  TextEditingController Lname = new TextEditingController();
  TextEditingController Nphone = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController user = new TextEditingController();
  TextEditingController email = new TextEditingController();

  @override
  late File? _image = null;
  late String url =
      'https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';

  void initState() {
    bool _passwordVisible = false;
  }

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(image!.path);
    setState(() {
      _image = pickedImageFile;
      print('Image Path $_image');
    });
  }

  Future openCard() => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            backgroundColor: Color.fromARGB(255, 160, 7, 7),
            title: Center(
              child: Text('Your account have been sign up !!!',
                  style: TextStyle(color: Colors.white)),
            ),
            content: Container(
              height: 80,
              child: Center(
                child: Column(
                  children: [
                    Text('Please Sign in again',
                        style: TextStyle(color: Colors.white)),
                    Text('to do purchase at SamyangApp',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (checkboxValue == false) {
                    print(checkboxValue);
                  }
                  if (checkboxValue == true) {
                    if (_image != null) {
                      if (Fname.text != '' &&
                          Lname.text != '' &&
                          Addres.text != '' &&
                          Nphone.text != '' &&
                          pass.text != '' &&
                          user.text != '' &&
                          email.text != '') {
                        await AuthServices.SignUp(
                            email.text,
                            pass.text,
                            user.text,
                            Fname.text,
                            Lname.text,
                            Nphone.text,
                            Addres.text,
                            _image,
                            url);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()));
                      } else {
                        Fluttertoast.showToast(msg: 'Textfield not filled');
                      }
                    } else {
                      Fluttertoast.showToast(msg: 'Profile image not filled');
                    }
                  } else {
                    Fluttertoast.showToast(msg: 'Chekbox not filled');
                  }
                },
                child: Text('OK', style: TextStyle(color: Colors.white)),
              ),
            ],
          ));

  Widget BuildNavigateButton(context) => SizedBox(
      width: 75,
      height: 75,
      child: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          size: 30,
        ),
        onPressed: () {
          openCard();
        },
        backgroundColor: Color.fromARGB(187, 160, 7, 7),
      ));

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return Scaffold(
        floatingActionButton: BuildNavigateButton(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        backgroundColor: Color.fromARGB(255, 95, 2, 2),
        body: Stack(
          children: [
            Container(
              height: 450,
              child: HeaderWidget(200, false, Icons.abc),
            ),
            Container(
              child: Scaffold(
                body: Center(
                  child: Container(
                    width: 355,
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromARGB(0, 0, 0, 0)),
                                  color: Color.fromARGB(255, 154, 26, 26),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor:
                                      Color.fromARGB(255, 253, 21, 21),
                                  child: ClipOval(
                                    child: new SizedBox(
                                      width: 140.0,
                                      height: 140.0,
                                      child: (_image != null)
                                          ? Image.file(
                                              _image!,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.asset(
                                              'Assets/18.png',
                                              fit: BoxFit.fitWidth,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: TextField(
                            controller: email,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                  ), // myIcon is a 48px-wide widget.
                                ),
                                hintText: 'Email',
                                hintStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          child: TextField(
                            controller: pass,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ), // myIcon is a 48px-wide widget.
                                ),
                                hintText: 'Password',
                                hintStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 3, bottom: 3),
                          child: TextField(
                            controller: user,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ), // myIcon is a 48px-wide widget.
                                ),
                                hintText: 'Username',
                                hintStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 170,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 4, top: 3, bottom: 3),
                                child: TextField(
                                  controller: Fname,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  122, 247, 5, 5),
                                              width: 3)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  122, 247, 5, 5),
                                              width: 3)),
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(
                                          Icons.badge,
                                          color: Colors.white,
                                        ), // myIcon is a 48px-wide widget.
                                      ),
                                      hintText: 'First Name',
                                      hintStyle:
                                          const TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                            Container(
                              width: 170,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 4, top: 3, bottom: 3),
                                child: TextField(
                                  controller: Lname,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  122, 247, 5, 5),
                                              width: 3)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                  122, 247, 5, 5),
                                              width: 3)),
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Icon(
                                          Icons.badge,
                                          color: Colors.white,
                                        ), // myIcon is a 48px-wide widget.
                                      ),
                                      hintText: 'Last Name',
                                      hintStyle:
                                          const TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: TextField(
                            controller: Nphone,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.phone_android,
                                    color: Colors.white,
                                  ), // myIcon is a 48px-wide widget.
                                ),
                                hintText: 'Phone Number',
                                hintStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          child: TextField(
                            maxLines: 3,
                            controller: Addres,
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 30),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Color.fromARGB(122, 247, 5, 5),
                                        width: 3)),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ), // myIcon is a 48px-wide widget.
                                ),
                                hintText: 'Address',
                                hintStyle:
                                    const TextStyle(color: Colors.white)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Center(
                            child: FormField<bool>(
                              builder: (state) {
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Checkbox(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                              ),
                                              side: MaterialStateBorderSide
                                                  .resolveWith(
                                                (states) => BorderSide(
                                                    width: 1.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ),
                                              value: checkboxValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxValue = value!;
                                                  state.didChange(value);
                                                });
                                              }),
                                          Text(
                                            "I accept all terms and conditions.",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255)),
                                          ),
                                        ],
                                      ),
                                    ]);
                              },
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
            )
          ],
        ));
  }
}
