import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ship_tracker/components/bottom_navbar.dart';
import 'package:ship_tracker/components/order_card.dart';
import 'package:ship_tracker/components/orderby.dart';
import 'package:ship_tracker/components/welcome_header.dart';
import 'package:ship_tracker/components/search_bar.dart';
import 'package:ship_tracker/pages/create_order_page.dart';
import 'package:ship_tracker/theme/theme.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: verde,
          foregroundColor: blanco,
          elevation: 0,
          title: Text(
            'Historial de órdenes',
            style: GoogleFonts.archivoBlack(
              fontSize: 20,
              color: blanco,
            ),
          ),
          centerTitle: true,
        ),

        backgroundColor: blanco,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                WelcomeHeader(),
                SizedBox(height: 16),
                Search(),
                SizedBox(height: 10),
                OrderFilter(),
                SizedBox(height: 16),

                OrderCard(
                  codigo: 'ABCD-1234',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Completado',
                  estadoColor: verdeClaro,
                ),
                OrderCard(
                  codigo: 'LKJH-9876',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Completado',
                  estadoColor: verdeClaro,
                ),
                OrderCard(
                  codigo: 'XYZA-4521',
                  direccion: 'Av. San Miguel 3605, Talca',
                  estado: 'Cancelado',
                  estadoColor: rojo,
                ),
              ],
            ),
          ),
        ),


        bottomNavigationBar: const BottomNavBar(selectedIndex: 1),

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
            decoration: BoxDecoration(
              color: verde,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: negro,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(Icons.add, color: blanco, size: 32),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}