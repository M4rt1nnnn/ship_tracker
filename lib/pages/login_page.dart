import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/pages/home.dart';
import 'package:ship_tracker/pages/register_page.dart';
import '../components/text_field.dart'; 
import '../components/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(234, 238, 238, 238),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo y título
              Image.asset('images/logo.png', height: 120),
              const SizedBox(height: 16),
              Text(
                'Ship-Tracker',
                style: GoogleFonts.archivoBlack(
                  fontSize: 25,
                  color: const Color(0xFF15A77F),
                ),
              ),
              const SizedBox(height: 48), // espacio entre título y formulario

              //Campos reutilizables
              const CustomTextField(
                labelText: 'Correo electrónico',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                labelText: 'Contraseña',
                obscureText: true,
              ),
              const SizedBox(height: 24),

              // Botón principal
              CustomButton(
                text: 'Iniciar Sesión',
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              const SizedBox(height: 16),

              //Texto intermedio
              const Text(
                '¿No tienes una cuenta?',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),

              //Botón secundario
              CustomButton(
                text: 'Registrarse',
                backgroundColor: Colors.white,
                textColor: const Color(0xFF15A77F),
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
