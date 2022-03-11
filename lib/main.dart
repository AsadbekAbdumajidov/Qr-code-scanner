import 'package:flutter/material.dart';
import 'screens/qr_create_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Qr code Scanner',
      debugShowCheckedModeBanner: false,
      home:  Scanner()
    );
  }
}
