import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // ancho controlado
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF15A77F),
            fontWeight: FontWeight.bold,
          ),

          // Borde normal
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),

          // Borde cuando se hace foco
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // 👈 igual en ambos
            borderSide: const BorderSide(
              color: Color(0xFF15A77F),
              width: 2,
            ),
          ),

          // Fondo
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
