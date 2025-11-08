import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/components/text_field.dart';
import 'package:ship_tracker/pages/home.dart';
import 'package:ship_tracker/theme/theme.dart';
import '../components/button.dart';

class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

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
            'Nuevo pedido',
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
                Text(
                  'Datos del cliente',
                  style: GoogleFonts.archivoBlack(
                    fontSize: 20,
                    color: negro,
                  ),
                ),

                const CustomTextField(labelText: '#ID del pedido'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Nombre completo'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Rut del cliente'),
                const SizedBox(height: 12),
                Text(
                  'Datos de entrega',
                  style: GoogleFonts.archivoBlack(
                    fontSize: 20,
                    color: negro,
                  ),
                ),
                const CustomTextField(labelText: 'Dirección de entrega'),
                const SizedBox(height: 12),
                const CustomTextField(labelText: 'Horario de entrega'),
                const SizedBox(height: 12),
                Text(
                  'Detalles adicionales',
                  style: GoogleFonts.archivoBlack(
                    fontSize: 20,
                    color: negro,
                  ),
                ),
                const CustomTextField(labelText: 'Notas adicionales', /*maxLines: 4*/),

                const SizedBox(height: 24),

                CustomButton(
                  text: 'Guardar pedido',
                  backgroundColor: verde,
                  textColor: blanco,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: 'Cancelar',
                  backgroundColor: blanco,
                  textColor: rojo,
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

      ),
    );
  }
}