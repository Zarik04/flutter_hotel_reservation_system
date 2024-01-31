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
  // static List<Hotel> hotels = [
  //   Hotel(
  //     name: 'The Plaza Hotel',
  //     imageUrl: 'img/hotel8.jpg',
  //     rating: 4.9,
  //     location: ' New York City',
  //   ),
  //   Hotel(
  //     name: 'Grand Lisboa',
  //     imageUrl: 'img/hotel2.jpg',
  //     rating: 4.2,
  //     location: ' Macau',
  //   ),
  //   Hotel(
  //     name: 'Hilton Worldwide',
  //     imageUrl: 'img/hotel3.jpg',
  //     rating: 4.0,
  //     location: ' New York City',
  //   ),
  //   Hotel(
  //     name: 'Grand Hyatt',
  //     imageUrl: 'img/hotel4.jpg',
  //     rating: 3.8,
  //     location: ' Dubai',
  //   ),
  //   Hotel(
  //     name: 'InterContinental',
  //     imageUrl: 'img/hotel5.jpg',
  //     rating: 4.7,
  //     location: 'Lusaka',
  //   ),
  //   Hotel(
  //     name: 'Premier Best Western',
  //     imageUrl: 'img/hotel6.jpg',
  //     rating: 4.2,
  //     location: ' Florida',
  //   ),
  //   Hotel(
  //     name: 'The Ritz-Carlton',
  //     imageUrl: 'img/hotel7.jpg',
  //     rating: 4.6,
  //     location: ' Vienna',
  //   ),
  //   Hotel(
  //     name: 'The Fullerton Hotel',
  //     imageUrl: 'img/hotel1.jpg',
  //     rating: 3.9,
  //     location: ' Singapore',
  //   ),
  // ];

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
