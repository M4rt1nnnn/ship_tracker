import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/components/bottom_navbar.dart';
import 'package:ship_tracker/components/order_card.dart';
import 'package:ship_tracker/components/orderby.dart';
import 'package:ship_tracker/components/welcome_header.dart';
import 'package:ship_tracker/components/search_bar.dart';
import 'package:ship_tracker/pages/create_order_page.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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
            'Historial de órdenes',
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
                  estado: 'Completado',
                  estadoColor: Colors.green,
                ),
                OrderCard(
                  codigo: 'LKJH-9876',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Completado',
                  estadoColor: Colors.green,
                ),
                OrderCard(
                  codigo: 'XYZA-4521',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Cancelado',
                  estadoColor: Colors.red,
                ),
              ],
            ),
          ),
        ),

        // 🟩 Barra inferior
        bottomNavigationBar: const BottomNavBar(selectedIndex: 1),

        // 🟢 Botón flotante que abre CreateOrderPage
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