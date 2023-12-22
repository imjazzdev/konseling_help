import 'package:flutter/material.dart';

class JadwalBK extends StatelessWidget {
  const JadwalBK({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jadwal BK'),
        ),
        body: Center(
          child: Image.asset('assets/jadwal.PNG'),
        ));
  }
}
