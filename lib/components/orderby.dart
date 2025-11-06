import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderFilter extends StatelessWidget {
  final VoidCallback? onTap; 
  const OrderFilter({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200], // fondo gris claro
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.sort, // ícono de filtro/orden
              color: Color(0xFF15A77F),
              size: 22,
            ),
            const SizedBox(width: 10),
            Text(
              'Ordenar por',
              style: GoogleFonts.inter(
                color: Colors.grey[700],
                fontSize: 14,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}