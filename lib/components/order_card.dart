import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/order_detail_modal.dart';

class OrderCard extends StatelessWidget {
  final String codigo;
  final String direccion;
  final String estado;
  final Color estadoColor;

  const OrderCard({
    super.key,
    required this.codigo,
    required this.direccion,
    required this.estado,
    required this.estadoColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 👇 Muestra modal al tocar cualquier parte de la card
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent, // fondo del modal transparente
          isScrollControlled: true,
          builder: (_) => const OrderDetailModal(), // modal aparte
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#$codigo',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.black54, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          direccion,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: estadoColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      estado,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: estadoColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('images/box.png', width: 55),
          ],
        ),
      ),
    );
  }
}