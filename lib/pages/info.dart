import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Image.asset(
                'assets/logo-sekolah.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Visi Dan Misi\nSMK Taruna Bhakti - Depok',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: Text('Visi SMK Taruna Bhakti',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Text(
                'Menghasilkan lulusan yang kompeten dalam IPTEK DAN  IMTAQ, serta mampu bersaing pada tingkat nasional dan global',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text('Misi SMK Taruna Bhakti',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              Text(
                '''Menumbuhkan semangat kreatifitas, bersinergi dan kompetitif kepada seluruh warga sekolah
\nMelaksanakan kurikulum melalui pembelajaran dan penilaian berbasis kompetensi, Berbasis wirausaha, berwawasan lingkungan.dan berlandaskan kejujuran
\nMeningkatkan kualitas sumber daya manusia melalui sertifikasi Kompetensi Tingkat Nasional dan Internasional
\nMengembangkan potensi peserta didik melalui kegiatan Minat dan Bakat dan pembinaan kedisiplinan
\nMenerapkan layanan prima dalam pengelolaan sekolah melalui Sistem Manajeman Mutu''',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 30,
        alignment: Alignment.center,
        color: Colors.grey.shade400,
        child: Text(
          'Copyright @ Ammar (2023)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
