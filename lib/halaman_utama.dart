
import 'package:flutter/material.dart';
import 'package:pemrogaman_2/detail.dart';
import 'package:pemrogaman_2/halaman_login.dart';
import 'package:pemrogaman_2/halaman_profil.dart';
import 'package:pemrogaman_2/halaman_rekomendasi.dart';
import 'package:pemrogaman_2/halaman_stopwatch.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Utama'),
        backgroundColor: Color.fromARGB(255, 6, 45, 78),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        )),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          MenuCard(
            icon: Icons.person_2_outlined,
            title: 'Profil',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilPage();
                  },
                ),
              );
            },
            color: Color.fromARGB(255, 6, 45, 78),
          ),
          MenuCard(
            icon: Icons.lock_clock,
            title: 'Stopwatch',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return StopwatchPage();
                  },
                ),
              );
            },
            color: const Color.fromARGB(255, 121, 190, 247),
          ),
          MenuCard(
            icon: Icons.book_online,
            title: 'Rekomendasi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return rekomendasi();
                  },
                ),
              );
            },
            color: Color.fromARGB(255, 6, 45, 78),
          ),
          MenuCard(
            icon: Icons.archive,
            title: 'Favorit',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return detailPage();
                  },
                ),
              );
            },
            color: Color.fromARGB(255, 121, 190, 247),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 6, 45, 78),
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BantuanPage()),
            );
          }
        },
      ),
    );
  }
}

class BantuanPage extends StatefulWidget {
  @override
  _BantuanPageState createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Bantuan'),
        backgroundColor: Color.fromARGB(255, 6, 45, 78),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cara Menggunakan Aplikasi:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '1. Profil: Lihat dan ubah informasi profil Anda.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                Text(
                  '2. Stopwatch: Gunakan stopwatch untuk mengukur waktu.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                Text(
                  '3. Rekomendasi: Temukan rekomendasi sesuai minat Anda.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                Text(
                  '4. Favorit: Lihat dan kelola daftar favorit Anda.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  'Penting:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Jika Anda mengalami masalah atau memiliki pertanyaan, hubungi tim dukungan kami di support@appname.com.',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 6, 45, 78),
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MenuPage()),
            );
          } else if (index == 1) {

          }
        },
      ),
    );
  }
}


class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  MenuCard({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15),
            Icon(
              icon,
              size: 50.0,
              color: Colors.blue,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
