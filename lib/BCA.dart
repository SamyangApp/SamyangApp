import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cart.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:flutter_application_1/CheckOut.dart';


class BCAPage extends StatelessWidget {
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
                padding: EdgeInsets.all(10),
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
                    Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('Pembayaran mengunakan metode BCA VIRTUAL ACCOUNT',
                        style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.all(5)),
                    Image(
                      image: AssetImage('Assets/B4.png'),
                      width: 300,
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Text('Kode Virtual Account Anda adalah',
                        style: TextStyle(color: Colors.white)),
                    Padding(padding: EdgeInsets.all(3)),
                    Row(
                      children: [
                        Image(image: AssetImage('Assets/B3.png'), width: 80),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          '10670081297723819',
                          style: TextStyle(
                              color: Color.fromARGB(255, 20, 162, 221),
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
            Text('1. Masukkan Kartu ATM BCA & PIN',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text(
                '2. Pilih menu Transaksi Lainnya > Transfer > ke Rekening BCA Virtual Account',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('3. Masukkan kode pembayaran Virtual Account.',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text(
                '4. Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti No VA',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('5. Masukkan Jumlah Transfer sesuai dengan Total Tagihan',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('6. Ikuti instruksi untuk menyelesaikan transaksi',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('7. Simpan struk transaksi sebagai bukti pembayaran',
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
        'Pembayaran via BCA-Mobile',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      children: [
        Padding(padding: EdgeInsets.only(bottom: 8)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Lakukan log in pada aplikasi BCA Mobile ',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('2. Pilih menu m-BCA, kemudian masukkan kode akses m-BCA',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('3. Pilih m-Transfer > BCA Virtual Account',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text(
                '4. Pilih dari Daftar Transfer, atau masukkan kode pembayaran virtual account',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('5. Masukkan pin m-BCA',
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
            Text('1. Login pada alamat Internet Banking BCA (https://klikbca.com)',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('2. Pilih menu Pembayaran Tagihan > Pembayaran > BCA Virtual Account',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('3. Pada kolom kode bayar, masukkan kode pembayaran virtual account',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('4. Di halaman konfirmasi, pastikan detil pembayaran sudah sesuai seperti Nomor BCA Virtual Account, Nama Pelanggan dan Jumlah Pembayaran',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('5. Masukkan password dan mToken',
                style: TextStyle(color: Colors.white)),
            Padding(padding: EdgeInsets.all(2)),
            Text('6. Cetak/simpan struk pembayaran BCA Virtual Account sebagai bukti pembayaran',
                style: TextStyle(color: Colors.white)),
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: 8)),
      ],
    ));
  }
}
