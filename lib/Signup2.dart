import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Login.dart';
import 'package:flutter_application_1/auth_services.dart';
import 'package:flutter_application_1/header_widget.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkboxValue = false;

  void initState() {
    bool _passwordVisible = false;
  }

  @override
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController user = new TextEditingController();
  TextEditingController Fname = new TextEditingController();
  TextEditingController Lname = new TextEditingController();
  TextEditingController Nphone = new TextEditingController();
  TextEditingController Addres = new TextEditingController();

  int Count = 0;

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
              child: HeaderWidget(200, false, Icons.person_add_alt_1_rounded),
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
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Color.fromARGB(255, 154, 26, 26),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey.shade700,
                                  size: 25.0,
                                ),
                              ),
                            ],
                          ),
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
                                    Icons.person,
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

  Widget BuildNavigateButton(context) => SizedBox(
      width: 75,
      height: 75,
      child: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          size: 30,
        ),
        onPressed: () {
          if (checkboxValue == false) {
            print(checkboxValue);
          }
          if (checkboxValue == true) {
            AuthServices.SignUp(email.text, pass.text, user.text, Fname.text, Lname.text, Nphone.text, Addres.text);
          }
        },
        backgroundColor: Color.fromARGB(187, 160, 7, 7),
      ));
}
