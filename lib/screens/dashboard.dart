import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/services/providers/hotel_provider.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';
import 'package:flutter_hotel_reservation_system/widget_items/hotel_card_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  static List<Hotel> hotels = [];

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    hotels = Provider.of<HotelProvider>(context).hotels;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 26.0,
              ),
              // Set your color and size here
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: HotelCardList(hotels: hotels),
      drawer: const DrawerMenu(),
    );
  }
}
