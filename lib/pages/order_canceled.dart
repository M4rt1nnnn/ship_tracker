import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/pages/home.dart';

class CancelOrderSuccessPage extends StatefulWidget {
  const CancelOrderSuccessPage({super.key});

  @override
  State<CancelOrderSuccessPage> createState() => _CancelOrderSuccessPageState();
}

class _CancelOrderSuccessPageState extends State<CancelOrderSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // 🎬 Controlador de animación
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _fadeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // ⏳ Volver al Home automáticamente después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 🚚 Parte superior: imagen (ocupa la mitad)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image.asset(
                'images/pic.jpg',
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
          ),

          // 🔴 Parte inferior: mensaje (ocupa la otra mitad)
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFE53935), // rojo fuerte
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 🚫 Animación del ícono
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: const Icon(
                      Icons.block_rounded,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // ✨ Animación del texto
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      'Pedido Cancelado\nExitosamente',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.archivoBlack(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}