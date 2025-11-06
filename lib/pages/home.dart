import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/components/bottom_navbar.dart';
import 'package:ship_tracker/components/order_card.dart';
import 'package:ship_tracker/components/orderby.dart';
import 'package:ship_tracker/components/welcome_header.dart';
import 'package:ship_tracker/components/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            'Ship-Tracker',
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
                OrderFilter(),
                SizedBox(height: 16),

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

        floatingActionButton: GestureDetector(
          onTap: () {
            // Aquí podrías abrir un modal o nueva vista de "Nuevo Pedido"
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) {
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Crear nuevo pedido',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              },
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
