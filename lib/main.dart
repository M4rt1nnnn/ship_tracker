import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // o el archivo donde está tu pantalla

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // quita etiqueta
      title: 'Ship-Tracker',
      home: LoginPage(), // tu pantalla principal
    );
  }
}