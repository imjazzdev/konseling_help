import 'package:flutter/material.dart';

import '../utils/service.dart';
import '../utils/varglobal.dart';

class DaftarKonseler extends StatefulWidget {
  const DaftarKonseler({super.key});

  @override
  State<DaftarKonseler> createState() => _DaftarKonselerState();
}

class _DaftarKonselerState extends State<DaftarKonseler> {
  // List<KonselerModel> list_konseler = [];
  // Services repository = Services();

  // getData() async {
  //   list_konseler = await repository.getKonseler();
  // }

  // @override
  // void initState() {
  //   getData();
  //   Future.delayed(
  //     Duration(seconds: 2),
  //     () {
  //       // isDataReady = true;
  //       setState(() {});
  //     },
  //   );

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Konseler'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(25),
        itemCount: VarGlobal.data_konseler.length,
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.purple.shade100),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    VarGlobal.data_konseler[index]['img'],
                    height: 70,
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    VarGlobal.data_konseler[index]['nama'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(VarGlobal.data_konseler[index]['email'])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
