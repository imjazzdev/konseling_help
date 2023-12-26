import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:konseling_help/pages/category_daftar_konseler.dart';
import 'package:konseling_help/pages/category_pelayanan_konseling.dart';
import 'package:konseling_help/pages/info.dart';
import 'package:konseling_help/pages/jadwal_bk.dart';
import 'package:konseling_help/pages/profile.dart';

import '../widget/carousel_banner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, Siswa!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Info(),
                    ));
              },
              icon: Icon(
                Icons.info_outline_rounded,
                size: 27,
              ))
        ],
      ),
      body: ListView(padding: EdgeInsets.only(bottom: 20), children: [
        CarouselBanner(),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            'Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        /**
         * FITUR INI BERISI LAYANAN KONSELING
         * 
         */
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryPelayananKonseling(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/customer-care.png',
                      height: 90,
                    ),
                    Text(
                      'Pelayanan\nKonseling',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),

            /**
         * FITUR INI BERISI DAFTAR GURU BK
         * 
         */
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DaftarKonseler(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/discussion.png',
                      height: 90,
                    ),
                    Text(
                      'Daftar\nKonseler',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JadwalBK(),
                    ));
              },
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.purple.shade50,
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/schedule.png',
                      height: 90,
                    ),
                    Text(
                      'Jadwal\nBK',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        height: 60,
        decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(15),
            color: Colors.purple.shade400),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.home,
              color: Colors.white,
              size: 40,
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ));
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
