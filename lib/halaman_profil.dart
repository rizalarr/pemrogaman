import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProfilPage extends StatelessWidget {
  final List<Map<String, String>> profil = [
    {
      'nama': 'Rizal Arifin',
      'id': '124210041',
      'email': 'rizalarvi0804@gmail.com',
      'nomorHP': '088228858986',
      'pathGambar': 'image/izal.jpg',
      'detail':
          'Hobi saya tidurr, gemar sekali makan. suka sekali menunda-nunda tugas. kegiatan yang ingin saya lakukan namun sampai saat ini belum tercapai adalah Mancing. cita cita ingin menjadi orang sukses:)',
    },
    {
      'nama': 'Nabil Makarim Hasymi',
      'id': '124210056',
      'email': 'nabil@example.com',
      'nomorHP': '08234567890',
      'pathGambar': 'image/nabilmakarim.jpg',
      'detail':
          'Halloooo nama saya Nabil Makarim Hasymi, kata orang lain kalo orang yang berkacamata itu artinya dia anak yang cerdas dan rajin emang iya yah?? Berarti kalo memang adanya seperti itu, saya anak nya cerdas dan rajin dong aamiin :P',
    },
    {
      'nama': 'Raden Yoka Fawwaz A.L',
      'id': '124210063',
      'email': 'yoka@example.com',
      'nomorHP': '08345678901',
      'pathGambar': 'image/radenyoka.jpg',
      'detail':
          'Halooo gaissss hihi, kenalin saya Raden Yoka aja nanti kalo diterusin nama saya kepanjangan kaya kereta api hehe, saya punya hobi berenang, main badminton dan makan, mau tau lebih banyak tentang saya? Tanyakan saja langsung pada orang nya :P, kalo ga mau juga gpp :(',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
        backgroundColor: Color.fromARGB(255, 6, 45, 78),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: CarouselSlider(
        items: profil.map((p) {
          return ProfilCard(profil: p);
        }).toList(),
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}

class ProfilCard extends StatelessWidget {
  final Map<String, String> profil;

  const ProfilCard({required this.profil});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white, 
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(profil['pathGambar']!),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50, bottom: 20, right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${profil['nama']} / ${profil['id']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Email: ${profil['email']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  'Nomer HP: ${profil['nomorHP']}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  profil['detail']!,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
