import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:konseling_help/pages/home.dart';

import '../utils/varglobal.dart';

class TambahKonseling extends StatefulWidget {
  const TambahKonseling({super.key});

  @override
  State<TambahKonseling> createState() => _TambahKonselingState();
}

class _TambahKonselingState extends State<TambahKonseling> {
  var nama = TextEditingController();
  var kelas = TextEditingController();
  var noHp = TextEditingController();
  var alamat = TextEditingController();
  var namaWali = TextEditingController();
  var konseling = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah pengaduan'),
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          Text(
            'Nama',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: nama,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Kelas',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: kelas,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'No Hp',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: noHp,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Alamat',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: alamat,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Nama Wali',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: namaWali,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Konseling',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: konseling,
            maxLines: 5,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),

      /**
         * FITUR INI BERFUNGSI MENAMBAHKAN DATA KONSELING SISWA
         * 
         */

      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
        child: ElevatedButton(
            onPressed: () {
              if (nama.text == '' ||
                  kelas.text == '' ||
                  noHp.text == '' ||
                  alamat.text == '' ||
                  namaWali.text == '' ||
                  konseling.text == '') {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.warning,
                  title: 'Data belum lengkap',
                  btnOkOnPress: () {},
                ).show();
              } else {
                addData();

                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.success,
                  title: 'Data ditambahkan',
                  btnOkOnPress: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                        (route) => false);
                  },
                ).show();
                print(VarGlobal.data_konseling);
              }
            },
            child: Text('Submit')),
      ),
    );
  }

  addData() {
    VarGlobal.data_konseling.add({
      'nama': nama.text.toString(),
      'kelas': kelas.text.toString(),
      'noHp': noHp.text.toString(),
      'alamat': alamat.text.toString(),
      'nama_wali': namaWali.text.toString(),
      'konseling': konseling.text.toString(),
      'tanggapan': '',
    });
  }
}
