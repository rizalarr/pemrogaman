import 'package:flutter/material.dart';
import 'package:pemrogaman_2/main.dart';

class bantuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Bantuan'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyApp();
              }));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            FAQItem(
              question: 'Bagaimana cara menghubungi kami?',
              answer:
                  'Anda dapat menghubungi kami melalui email di help@example.com atau menghubungi nomor telepon 123-456-789.',
            ),
            FAQItem(
              question: 'Apakah layanan kami berbayar?',
              answer: 'Tidak, layanan kami sepenuhnya gratis.',
            ),
            FAQItem(
              question: 'Bagaimana cara mereset kata sandi?',
              answer:
                  'Anda dapat mereset kata sandi melalui halaman masuk dengan mengklik "Lupa Kata Sandi".',
            ),
          ],
        ),
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(answer),
        ],
      ),
    );
  }
}