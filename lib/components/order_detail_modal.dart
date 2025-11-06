import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/pages/order_canceled.dart';
import 'package:ship_tracker/pages/order_completed.dart';
import '../components/button.dart';

class OrderDetailModal extends StatelessWidget {
  const OrderDetailModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      decoration: const BoxDecoration(
        color: Color(0xFF0E0E2D),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 20, backgroundImage: AssetImage('images/profilepic.jpg')),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('María Becerra',
                      style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('12.901.345-K', style: GoogleFonts.inter(color: Colors.white70)),
                ],
              ),
              const Spacer(),
              Text('#ABCD-1234',
                  style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 18),
          Text('Detalle del envío:',
              style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoItem(Icons.access_time, '08:00'),
              _infoItem(Icons.schedule, '12:00'),
              _infoItem(Icons.location_on, '27 Sur 954'),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('images/map.jpg', fit: BoxFit.cover, height: 100, width: double.infinity),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Confirmar',
                  backgroundColor: Colors.green,
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OrderSuccessPage()),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12), // separación entre botones
              Expanded(
                child: CustomButton(
                  text: 'Cancelar',
                  backgroundColor: Colors.red,
                  textColor: const Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CancelOrderSuccessPage()),
                    );
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

  Widget _infoItem(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 4),
        Text(label, style: GoogleFonts.inter(color: Colors.white70)),
      ],
    );
  }

  Widget _actionButton(String text, Color color, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text,
          style: GoogleFonts.inter(color: textColor, fontWeight: FontWeight.w600)),
    );
  }
}