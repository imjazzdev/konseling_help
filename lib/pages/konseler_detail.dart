import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:konseling_help/utils/varglobal.dart';
import 'package:url_launcher/url_launcher.dart';

class KonselerDetail extends StatefulWidget {
  final String nama, kelas, alamat, nama_wali, noHp, konseling;
  final int index;

  const KonselerDetail(
      {super.key,
      required this.nama,
      required this.kelas,
      required this.alamat,
      required this.nama_wali,
      required this.noHp,
      required this.konseling,
      required this.index});

  @override
  State<KonselerDetail> createState() => _KonselerDetailState();
}

class _KonselerDetailState extends State<KonselerDetail> {
  var tanggapan = TextEditingController();
  bool tanggapanDone = false;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(1.1455625, 104.0136126),
    zoom: 17.4746,
  );

  List<Marker> addmarker() {
    List<Marker> marker = [
      Marker(
        markerId: MarkerId('1'),
        position: LatLng(1.1455625, 104.0136126),
        draggable: true,
      )
    ];
    return marker;
  }

  @override
  void initState() {
    if (VarGlobal.data_konseling[widget.index]['tanggapan'] != '') {
      tanggapanDone = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.purple.shade200,
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Siswa',
              style: TextStyle(color: Colors.purple.shade200, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
            },
            children: [
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nama',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.nama, style: TextStyle(fontSize: 16)),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Kelas',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.kelas, style: TextStyle(fontSize: 16)),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No HP',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.noHp, style: TextStyle(fontSize: 16)),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Alamat',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.alamat, style: TextStyle(fontSize: 16)),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Nama Wali',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.nama_wali, style: TextStyle(fontSize: 16)),
                ),
              ]),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () async {
              final Uri url = Uri.parse(
                  'https://www.google.com/maps/place/SMK+Taruna+Bhakti+Depok/@-6.3839264,106.8673087,17z/data=!3m1!4b1!4m6!3m5!1s0x2e69ebaff005f277:0x9fcd41028665eea8!8m2!3d-6.3839264!4d106.8698783!16s%2Fg%2F11qq76gtsm?entry=ttu');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: Container(
              height: 170,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/maps.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Konseling',
            style: TextStyle(fontSize: 16, color: Colors.purple),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(widget.konseling),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple.shade100),
          ),
          SizedBox(
            height: 15,
          ),
          tanggapanDone == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggapan',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                          VarGlobal.data_konseling[widget.index]['tanggapan']),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade100),
                    ),
                  ],
                )
              : SizedBox()
        ],
      ),

      /**
         * FITUR INI BERFUNGSI MEMBERI 
         * TANGGAPAN KONSELING GURU TERHADAP SISWA
         * 
         */

      bottomNavigationBar: tanggapanDone == true
          ? SizedBox()
          : Container(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.info,
                      body: TextField(
                        controller: tanggapan,
                        maxLines: 4,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Tanggapan'),
                      ),
                      btnOkOnPress: () {
                        setState(() {
                          tanggapanDone = true;
                          VarGlobal.data_konseling[widget.index]['tanggapan'] =
                              tanggapan.text;
                          print(VarGlobal.data_konseling);
                        });
                      },
                    ).show();
                  },
                  child: Text('Tanggapan')),
            ),
    );
  }
}
