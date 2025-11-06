import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Fondo gris claro
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Color(0xFF15A77F),
            size: 22,
          ),
          const SizedBox(width: 10),

          // 👉 Campo de texto editable
          Expanded(
            child: TextField(
              cursorColor: const Color(0xFF15A77F),
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                isDense: true, // ajusta altura
                border: InputBorder.none, // sin borde
                hintText: 'Buscar pedido',
                hintStyle: GoogleFonts.inter(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}