import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/Cart.dart';

class BRIPage extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Flutter App',
        debugShowCheckedModeBanner: false,
        home: Container(
          decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [
            Color.fromARGB(255, 0, 0, 0),
            Color.fromARGB(255, 117, 11, 3),
          ], radius: 2)),
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Cart()));
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                        alignment: const Alignment(0, 0),
                      )),
                  Icon(Icons.credit_card),
                  Padding(padding: EdgeInsets.all(5)),
                  Text('Pembayaran')
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        width: 360,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Batas Akhir Pembayaran',
                                    style: TextStyle(color: Colors.white)),
                                Text('Sabtu, 30 April 2022 01:35',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            Text('00:01:00',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                     Padding(padding: EdgeInsets.all(6)),
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('Pembayaran mengunakan metode BRI VIRTUAL ACCOUNT',
                        style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.all(7)),
                    Image(
                      image: AssetImage('Assets/B5.png'),
                      width: 300,
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Text('Kode Virtual Account Anda adalah',
                        style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.all(7)),
                    Row(
                      children: [
                        Image(image: AssetImage('Assets/B1.png'), width: 80),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          '20670081297723819',
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 96, 175),
                              fontSize: 27),
                        )
                      ],
                    ),
                    ExpansiveListATM(),
                    ExpansiveListMobile(),
                    ExpansiveListInet(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('Assets/20.png'),width: 100,),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
          ),
        ));
  }

  Widget ExpansiveListATM() {
    return ListTileTheme(
        child: ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Text(
        'Pembayaran via ATM',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      children: [
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Masukkan Kartu ATM BRI & PIN',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text(
                '2. Pilih menu Transaksi Lainnya > Transfer > ke Rekening BRIVA',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('3. Masukkan kode pembayaran Virtual Account.',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text(
                '4. Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti No VA',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('5. Ikuti instruksi untuk menyelesaikan transaksi',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('6. Simpan struk transaksi sebagai bukti pembayaran',
                style: TextStyle(color: Colors.white)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
      ],
    ));
  }

  Widget ExpansiveListMobile() {
    return ListTileTheme(
        child: ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Text(
        'Pembayaran via BRI-Mobile',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      children: [
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Lakukan log in pada aplikasi BRI Mobile ',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('2. Pilih menu m-BRI, kemudian masukkan kode akses m-BRI',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('3. Pilih m-Transfer > BRIVA',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text(
                '4. Pilih dari Daftar Transfer, atau masukkan kode pembayaran virtual account',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('5. Masukkan pin m-BRI',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text(
                '6. Pembayaran selesai. Simpan notifikasi yang muncul sebagai bukti pembayaran',
                style: TextStyle(color: Colors.white)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
      ],
    ));
  }

  Widget ExpansiveListInet() {
    return ListTileTheme(
        child: ExpansionTile(
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      title: Text(
        'Pembayaran via Internet Banking',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      children: [
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Login pada alamat Internet Banking BRI (https://klikBRI.com)',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('2. Pilih menu Pembayaran Tagihan > Pembayaran > BRIVA',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('3. Pada kolom kode bayar, masukkan kode pembayaran virtual account',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('4. Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti Nomor BRI Virtual Account, Nama Pelanggan dan Jumlah Pembayaran',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('5. Masukkan password dan mToken',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('6. Cetak/simpan struk pembayaran BRI Virtual Account sebagai bukti pembayaran',
                style: TextStyle(color: Colors.white)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
      ],
    ));
  }
}


