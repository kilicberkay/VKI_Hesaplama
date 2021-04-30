import 'package:flutter/material.dart';

class hakkimda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hakkımda",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Text(
              'Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL '
              'PROGRAMLAMA dersi kapsamında 183311018 numaralı Öğrenci Berkay KILIÇ tarafından 30 Nisan 2021 günü yapılmıştır.',
              style: TextStyle(
                  // your text
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Geri Dön!'),
            ),
          ),
        ],
      ),
    );
  }
}
