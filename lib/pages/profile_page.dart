import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/components/bottom_navbar.dart';
import 'package:ship_tracker/components/text_field.dart';
import 'package:ship_tracker/pages/home.dart';
import '../components/button.dart';
import 'package:ship_tracker/theme/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), 
      child: Scaffold(
        backgroundColor: blanco,

        appBar: AppBar(
          backgroundColor: verde,
          foregroundColor: blanco,
          elevation: 0,
          title: Text(
            'Editar perfil',
            style: GoogleFonts.archivoBlack(
              fontSize: 20,
              color: blanco,
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
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: gris,
                        child: Icon(
                          Icons.person_outline,
                          size: 50,
                          color: negro,
                        ),
                      ),

                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: verde,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: negro,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.edit, 
                              color: blanco,
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
                  backgroundColor: azulOscuro,
                  textColor: blanco,
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