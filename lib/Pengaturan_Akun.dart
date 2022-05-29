import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AturAkun extends StatefulWidget {
  late User user;


  AturAkun(this.user, {Key? key}) : super(key: key);

  @override
  State<AturAkun> createState() => _AturAkunState(user);
}

class _AturAkunState extends State<AturAkun> {
  late User user;
  late File? _image = null;
  late String url2 = '';

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(image!.path);
    setState(() {
      _image = pickedImageFile;
      print('Image Path $_image');
    });
  }

  Future uploadPic(String Username) async{
    final ref = FirebaseStorage.instance
        .ref()
        .child('UserImage')
        .child(user.uid  + '.jpg');
    await ref.putFile(_image!);
    url2 = await ref.getDownloadURL();
    print(url2);
  }

  _AturAkunState(this.user);

  @override
  TextEditingController UsernameController = new TextEditingController();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PnumController = new TextEditingController();

  @override
  void UpdateUser(String OldUsername, String OldEmail, String OldPnum, String NewUsername, String NewEmail, String NewPnum, String url) {
    final UserList = FirebaseFirestore.instance
        .collection('User')
        .doc(user.uid)
        .collection('UserList')
        .doc('44Tc00KHxUuduJ2m8FsM');
    UserList.update({
      'Username' : (NewUsername == '') ? OldUsername : NewUsername,
      'Email' : (NewEmail == '') ? OldEmail : NewEmail,
      'Pnum' : (NewPnum == '') ? OldPnum : NewPnum,
      'img' : (url2 == '') ? url : url2,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Text('Pengaturan Akun'),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(0, 255, 0, 0),
      ),

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 189, 4, 4),
            Color.fromARGB(255, 107, 10, 3),
            Color.fromARGB(255, 34, 3, 1),
            Color.fromARGB(255, 117, 11, 3),
            Color.fromARGB(255, 185, 3, 3),
          ],
        )),
        child:SingleChildScrollView( 
        child: Center(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                        .collection('User')
                        .doc(user.uid)
                        .collection('UserList')
                        .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final User = snapshot.data!.docs;

                    return GridView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 0.5,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return BuildPengaturanAkun(
                            User[index]['img'],
                            User[index]['Username'],
                            User[index]['Email'],
                            User[index]['Pnum'],
                          );
                        },
                      );
                    } else {
                      print('error');
                      return Text('error');
                    }
                  }),
          ]),
        ),
        ),
      ),
      backgroundColor: Color.fromARGB(0, 39, 1, 1),
    );
  }

  Widget BuildPengaturanAkun(String url, String Username, String Email, String Pnum) {
    return Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 10),
                  child: GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor: Color(0xff476cfb),
                                  child: ClipOval(
                                    child: new SizedBox(
                                      width: 140.0,
                                      height: 140.0,
                                      child: (_image != null) ? Image.file(
                                        _image!,
                                        fit: BoxFit.fill,
                                      ) : Image.network(
                                       url,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                  ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 310,
                    child: TextField(
                      controller: UsernameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color:  Color.fromARGB(122, 247, 5, 5),
                                  width: 3)),
                          filled: true,
                          fillColor: Color.fromARGB(0, 0, 0, 0),
                          hintText: Username, hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 310,
                    child: TextField(
                      controller: EmailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color:  Color.fromARGB(122, 247, 5, 5),
                                  width: 3)),
                          filled: true,
                          fillColor: Color.fromARGB(0, 0, 0, 0),
                          hintText: Email, hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 310,
                    child: TextField(
                      controller: PnumController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide(
                                color: Color.fromARGB(122, 247, 5, 5),
                                width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color:  Color.fromARGB(122, 247, 5, 5),
                                  width: 3)),
                          filled: true,
                          fillColor: Color.fromARGB(0, 0, 0, 0),
                          hintText: Pnum, hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      Color.fromARGB(255, 255, 0, 0),
                                      Color.fromARGB(255, 134, 11, 11),
                                      Color.fromARGB(255, 88, 3, 3),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () async {
                                if (_image == null) {
                                  UpdateUser(Username, Email, Pnum, UsernameController.text, EmailController.text, PnumController.text, url);
                                  Navigator.pop(context);
                                } else {
                                  await uploadPic(Username);
                                  UpdateUser(Username, Email, Pnum, UsernameController.text, EmailController.text, PnumController.text, url);
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(fontSize: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
  }
}
