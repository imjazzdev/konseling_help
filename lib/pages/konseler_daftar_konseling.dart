import 'package:flutter/material.dart';
import 'package:konseling_help/pages/konseler_detail.dart';
import 'package:konseling_help/pages/tambah_konseling.dart';

import '../utils/varglobal.dart';

class KonselerDaftarKonseling extends StatelessWidget {
  const KonselerDaftarKonseling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: VarGlobal.data_konseling.length,
        padding: EdgeInsets.all(25),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KonselerDetail(
                      nama: VarGlobal.data_konseling[index]['nama'],
                      kelas: VarGlobal.data_konseling[index]['kelas'],
                      alamat: VarGlobal.data_konseling[index]['alamat'],
                      nama_wali: VarGlobal.data_konseling[index]['nama_wali'],
                      noHp: VarGlobal.data_konseling[index]['noHp'],
                      konseling: VarGlobal.data_konseling[index]['konseling'],
                      index: index),
                ));
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(15),
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.purple.withOpacity(0.3),
                      offset: Offset(3, 3),
                      blurRadius: 10)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  VarGlobal.data_konseling[index]['nama'],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  VarGlobal.data_konseling[index]['kelas'],
                ),
                Text(
                  VarGlobal.data_konseling[index]['noHp'],
                ),
                Text(
                  VarGlobal.data_konseling[index]['konseling'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.purple.shade200),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => TambahKonseling(),
      //         ));
      //   },
      //   child: Icon(
      //     Icons.add,
      //     size: 28,
      //   ),
      // ),
    );
  }
}
