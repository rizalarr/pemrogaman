import 'package:flutter/material.dart';
import 'package:pemrogaman_2/halaman_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}




















































