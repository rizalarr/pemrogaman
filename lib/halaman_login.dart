import 'package:flutter/material.dart';
import 'package:pemrogaman_2/halaman_utama.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INAKA Stopwatch'),
        backgroundColor: const Color.fromARGB(255, 6, 45, 78),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.only(top: 15 ,bottom: 20 ,right: 60,left: 60),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'image/login.png',
                    fit: BoxFit.contain,
                    height: 250,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(
                        Icons.person_2,
                        color: Color.fromARGB(255, 6, 45, 78), 
                      ),
                    labelStyle: TextStyle(color: Color.fromARGB(255, 6, 45, 78)),
                    focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 6, 45, 78)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 6, 45, 78).withOpacity(0.5)),
                        ),
                      ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    style: TextStyle(color: Color.fromARGB(255, 6, 45, 78)),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                   decoration: InputDecoration(
                    labelText: 'Password',
                   prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 6, 45, 78),
                      ),
                        labelStyle: TextStyle(color: Color.fromARGB(255, 6, 45, 78)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 6, 45, 78)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 6, 45, 78).withOpacity(0.5)),
                        ),
                      ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    style: TextStyle(color: Color.fromARGB(255, 6, 45, 78)),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_usernameController.text == 'admin' &&
                            _passwordController.text == 'admin') {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MenuPage(),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('waduh EROR'),
                                content: Text(
                                  'Login gagal. tulung lebok ke username karo password sek bener',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
