import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/components/bottom_navbar.dart';
import 'package:ship_tracker/components/text_field.dart';
import 'package:ship_tracker/pages/home.dart';
import '../components/button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Cierra el teclado al tocar fuera
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),

        appBar: AppBar(
          backgroundColor: const Color(0xFF15A77F),
          foregroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Editar perfil',
            style: GoogleFonts.archivoBlack(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),

                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundColor: Color(0xFFDADADA),
                        child: Icon(
                          Icons.person_outline,
                          size: 50,
                          color: Colors.black54,
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            //después colocar editar imagen
                          },
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF15A77F),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.edit, // Ícono de lápiz
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const CustomTextField(labelText: 'Nombre'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Apellido'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Rut'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Teléfono'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Correo electrónico'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Contraseña', obscureText: true),

                const SizedBox(height: 48),

                CustomButton(
                  text: 'Guardar',
                  backgroundColor: const Color(0xFF0E0E2D),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
      ),
    );
  }
}