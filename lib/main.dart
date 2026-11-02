import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const BiomedlukeApp());
}

class BiomedlukeApp extends StatelessWidget {
  const BiomedlukeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biomedluke Mobile Connect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}