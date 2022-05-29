import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Alamat extends StatefulWidget {
  late User user;

  Alamat(this.user, {Key? key}) : super(key: key);

  @override
  State<Alamat> createState() => _nameState(user);
}

class _nameState extends State<Alamat> {
  late User user;

  TextEditingController AddresName = new TextEditingController();
  TextEditingController Fname = new TextEditingController();
  TextEditingController Lname = new TextEditingController();
  TextEditingController Addres = new TextEditingController();
  TextEditingController Pnum = new TextEditingController();

  _nameState(this.user);

  Future PilihAlamat(String AddresName) async {
    final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      sharedPreferences.setString('Address', AddresName);
    print("Alamat yang dipiih " + sharedPreferences.getString('Address').toString());
  }

  void UpdateAddress(
      String oldFname,
      String oldLname,
      String oldAddres,
      String oldPnum,
      String oldAddresName,
      String Fname,
      String Lname,
      String Addres,
      String Pnum,
      String AddresName,
      String UidAddres) {
    final AddresList = FirebaseFirestore.instance
        .collection('User')
        .doc(user.uid)
        .collection('AddresList')
        .doc(UidAddres);

    AddresList.update({
      'Pnum': (Pnum == '')
          ? oldPnum
          : Pnum, // if pnum == '' pnum:oldpnum else pnum:pnum
      'Addres': (Addres == '') ? oldAddres : Addres,
      'Fname': (Fname == '') ? oldFname : Fname,
      'Lname': (Lname == '') ? oldLname : Lname,
      'AddresName': (AddresName == '') ? oldAddresName : AddresName
    });
  }

  void AddAddress(
      String Fname,
      String Lname,
      String Addres,
      String Pnum,
      String AddresName,
    ) {
    final AddresList = FirebaseFirestore.instance
        .collection('User')
        .doc(user.uid)
        .collection('AddresList')
        .doc(AddresName);
    
    final json = ({
       'Pnum': Pnum, // if pnum == '' pnum:oldpnum else pnum:pnum
      'Addres': Addres,
      'Fname': Fname,
      'Lname': Lname,
      'AddresName': AddresName,
      'UidAddres' : AddresName
    });

    AddresList.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Text(
                'Pengaturan Alamat',
              ),
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
      ),
      floatingActionButton: BuildNavigateButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('User')
                .doc(user.uid)
                .collection('AddresList')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                final User = snapshot.data!.docs;
                return GridView.builder(
                  itemCount: User.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 1.4),
                  itemBuilder: (BuildContext context, int index) {
                    return ListAlamat(
                        User[index]['Fname'],
                        User[index]['Lname'],
                        User[index]['Addres'],
                        User[index]['Pnum'],
                        User[index]['AddresName'],
                        User[index]['UidAddres']);
                  },
                );
              } else {
                return Text('Error');
              }
            },
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 1, 1),
    );
  }

  Widget ListAlamat(String Fname, String Lname, String Addres, String Pnum,
      String AddresName, String UidAddres) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
                Color.fromARGB(255, 172, 6, 6),
                Color.fromARGB(255, 0, 0, 0)
              ], radius: 0.8),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: const Color.fromARGB(137, 192, 3, 3), width: 3)),
          child: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 5),
                    child: Text(AddresName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        '$Fname $Lname',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      child: Text(
                        Pnum,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        Addres,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 10,
                  left: 0,
                  right: 170,
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        openBoxUbahAlamat(Fname, Lname, Addres, AddresName, Pnum, UidAddres);

                      },
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 150,
                        height: 40,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 255, 0, 0),
                              Color.fromARGB(255, 134, 11, 11),
                              Color.fromARGB(255, 177, 7, 7),
                            ],
                          ),
                        ),
                        child: Center(child: Text('Ubah Alamat', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                      ),
                    ),
                    )
                  )),
              Positioned(
                  bottom: 10,
                  left: 170,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        PilihAlamat(UidAddres);
                      },
                      child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 150,
                        height: 40,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 255, 0, 0),
                              Color.fromARGB(255, 134, 11, 11),
                              Color.fromARGB(255, 168, 8, 8),
                            ],
                          ),
                        ),
                        child: Center(child: Text('Pilih Alamat', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold))),
                      ),
                    ),
                    )
                  ))
            ],
          )),
    );
  }

  Future openBoxUbahAlamat(String oldFname, String oldLname, String oldAddress,
          String oldAddresName, String oldPnum, String UidAddres) =>
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                backgroundColor: Color.fromARGB(162, 0, 0, 0),
                title: Center(
                  child: Text(
                    'Change Your Address',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                content: Container(
                    height: 440,
                    width: 400,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                            TextField(
                              controller: AddresName,
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
                                  hintText: 'Address Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                            TextField(
                              controller: Fname,
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
                                  hintText: 'First Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                            TextField(
                              controller: Lname,
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
                                  hintText: 'Last Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: TextField(
                                maxLines: 4,
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
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
                                            width: 3)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: TextField(
                                controller: Pnum,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
                                            width: 3)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 2),
                                  child: Container(
                                    width: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                            child: Container(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  172, 247, 6, 6),
                                              minimumSize:
                                                  const Size.fromHeight(
                                                      50), // NEW
                                            ),
                                            onPressed: () {
                                              Fname.clear();
                                              Lname.clear();
                                              Addres.clear();
                                              AddresName.clear();
                                              Pnum.clear();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Close',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 2),
                                  child: Container(
                                    width: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                            child: Container(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  172, 247, 6, 6),
                                              minimumSize:
                                                  const Size.fromHeight(
                                                      50), // NEW
                                            ),
                                            onPressed: () async {
                                              UpdateAddress(
                                                  oldFname,
                                                  oldLname,
                                                  oldAddress,
                                                  oldPnum,
                                                  oldAddresName,
                                                  Fname.text,
                                                  Lname.text,
                                                  Addres.text,
                                                  Pnum.text,
                                                  AddresName.text,
                                                  UidAddres);
                                              Fname.clear();
                                              Lname.clear();
                                              Addres.clear();
                                              AddresName.clear();
                                              Pnum.clear();
                                              Navigator.pop(context);
                                              print(
                                                  'AddresName ${oldAddresName}');
                                            },
                                            child: const Text(
                                              'Ubah Alamat',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ));

  Future openBoxTambahAlamat() =>
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                backgroundColor: Color.fromARGB(162, 0, 0, 0),
                title: Center(
                  child: Text(
                    'Add Address',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                content: Container(
                    height: 440,
                    width: 400,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                            TextField(
                              controller: AddresName,
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
                                  hintText: 'Address Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                            TextField(
                              controller: Fname,
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
                                  hintText: 'First Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                            Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                            TextField(
                              controller: Lname,
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
                                  hintText: 'Last Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white)),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: TextField(
                                maxLines: 4,
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
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
                                            width: 3)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: TextField(
                                controller: Pnum,
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
                                            width: 3)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(50),
                                        borderSide: const BorderSide(
                                            color:
                                                Color.fromARGB(122, 247, 5, 5),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 2),
                                  child: Container(
                                    width: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                            child: Container(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  172, 247, 6, 6),
                                              minimumSize:
                                                  const Size.fromHeight(
                                                      50), // NEW
                                            ),
                                            onPressed: () {
                                              Fname.clear();
                                              Lname.clear();
                                              Addres.clear();
                                              AddresName.clear();
                                              Pnum.clear();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Close',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 2),
                                  child: Container(
                                    width: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Stack(
                                        children: <Widget>[
                                          Positioned.fill(
                                            child: Container(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                  172, 247, 6, 6),
                                              minimumSize:
                                                  const Size.fromHeight(
                                                      50), // NEW
                                            ),
                                            onPressed: () async {
                                              AddAddress(
                                                  Fname.text,
                                                  Lname.text,
                                                  Addres.text,
                                                  Pnum.text,
                                                  AddresName.text,
                                              );
                                              Fname.clear();
                                              Lname.clear();
                                              Addres.clear();
                                              AddresName.clear();
                                              Pnum.clear();
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              'Tambah Alamat',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ));

  Widget BuildNavigateButton(context) => FloatingActionButton.extended(
        heroTag: "btn2",
        label: Text('Tambah Alamat', style: TextStyle(fontSize: 18)),
        onPressed: () {
          openBoxTambahAlamat();
        },
        backgroundColor: Color.fromARGB(187, 160, 7, 7),
        elevation: 1000,
        icon: Icon(Icons.add, size: 28),
      );
}
