import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: const Color(0xFF15A77F),
      ),
      body: const Center(
        child: Text(
          'Aquí irá el formulario de registro',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
