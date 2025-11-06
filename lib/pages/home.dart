import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/components/bottom_navbar.dart';
import 'package:ship_tracker/components/order_card.dart';
import 'package:ship_tracker/components/welcome_header.dart';
import 'package:ship_tracker/components/search_bar.dart';
import 'package:ship_tracker/pages/create_order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 👇 Cierra el teclado al tocar fuera del campo
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF15A77F),
          foregroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Inicio',
            style: GoogleFonts.archivoBlack(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),

        backgroundColor: Colors.white,

        // 📦 Cuerpo principal
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                WelcomeHeader(),
                SizedBox(height: 16),
                Search(),
                SizedBox(height: 10),

                // 🧩 Cards de pedidos
                OrderCard(
                  codigo: 'ABCD-1234',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Pendiente',
                  estadoColor: Colors.amber,
                ),
                OrderCard(
                  codigo: 'LKJH-9876',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Pendiente',
                  estadoColor: Colors.amber,
                ),
                OrderCard(
                  codigo: 'XYZA-4521',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Pendiente',
                  estadoColor: Colors.amber,
                ),
              ],
            ),
          ),
        ),

        // 🟩 Barra inferior y botón flotante
        bottomNavigationBar: const BottomNavBar(selectedIndex: 0),

        // ✅ Botón flotante que lleva a CreateOrderPage
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateOrderPage()),
            );
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Color(0xFF15A77F),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}