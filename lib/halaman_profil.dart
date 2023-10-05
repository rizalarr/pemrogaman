import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data Profil Pengguna
    List<Map<String, dynamic>> userProfiles = [
      {
        'Nama': 'Rizal Arifin',
        'Email': 'rizalarvi0408@gmail.comm',
        'NIM': '124210041',
        'Alamat': 'Jalan Contoh No. 123, Kota',
        'Foto': 'assets/john_doe.jpg',
      },
      {
        'Nama': 'Nabil Makarim Hasymi',
        'Email': 'nabilhasymi24@gmail.com',
        'NIM': '124210056',
        'Alamat': 'Jalan Lain No. 456, Kota',
        'Foto': 'assets/jane_smith.jpg',
      },
      {
        'Nama': 'Raden Yoka Fawwaz',
        'Email': 'lukmanyoka@gmail.co',
        'NIM': '124210063',
        'Alamat': 'Jalan Baru No. 789, Kota',
        'Foto': 'assets/bob_johnson.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Menampilkan Profil untuk Setiap Pengguna dengan Card
          for (var userProfile in userProfiles)
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage(userProfile['Foto']),
                    ),
                    SizedBox(height: 16),
                    Divider(
                        //color: Colors.blueAccent,
                        ),
                    SizedBox(height: 16),
                    ...userProfile.entries
                        .where((entry) => entry.key != 'Foto')
                        .map(
                            (entry) => buildProfileItem(entry.key, entry.value))
                        .toList(),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildProfileItem(String label, dynamic value) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //color: Colors.blueAccent,
        ),
      ),
      subtitle: Text(
        value.toString(),
        style: TextStyle(
            //color: Colors.grey[800],
            ),
      ),
    );
  }
}