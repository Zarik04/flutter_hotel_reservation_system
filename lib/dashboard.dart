import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/drawer_menu.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Dashboard'),
      ),
      body: const HotelCardList(),
      drawer: const DrawerMenu(),
    );
  }
}

class HotelCardList extends StatelessWidget {
  const HotelCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Hotel> hotels = [
      Hotel(
        name: 'The Plaza Hotel',
        imageUrl: 'img/hotel8.jpg',
        rating: 4.9,
        location: ' New York City',
      ),
      Hotel(
        name: 'Grand Lisboa',
        imageUrl: 'img/hotel2.jpg',
        rating: 4.2,
        location: ' Macau',
      ),
      Hotel(
        name: 'Hilton Worldwide',
        imageUrl: 'img/hotel3.jpg',
        rating: 4.0,
        location: ' New York City',
      ),
      Hotel(
        name: 'Grand Hyatt',
        imageUrl: 'img/hotel4.jpg',
        rating: 3.8,
        location: ' Dubai',
      ),
      Hotel(
        name: 'InterContinental',
        imageUrl: 'img/hotel5.jpg',
        rating: 4.7,
        location: 'Lusaka',
      ),
      Hotel(
        name: 'Premier Best Western',
        imageUrl: 'img/hotel6.jpg',
        rating: 4.2,
        location: ' Florida',
      ),
      Hotel(
        name: 'The Ritz-Carlton',
        imageUrl: 'img/hotel7.jpg',
        rating: 4.6,
        location: ' Vienna',
      ),
      Hotel(
        name: 'The Fullerton Hotel',
        imageUrl: 'img/hotel1.jpg',
        rating: 3.9,
        location: ' Singapore',
      ),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print('Clicked on ${hotels[index].name}');
          },
          child: HotelCard(hotel: hotels[index]),
        );
      },
    );
  }
}

class Hotel {
  final String name;
  final String imageUrl;
  final double rating;
  final String location;

  Hotel({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.location,
  });
}

class HotelCard extends StatelessWidget {
  final Hotel hotel;

  const HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              hotel.imageUrl,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: TextStyle(
                    color: Colors.deepPurple.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rating: ${hotel.rating}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo.shade200,
                      ),
                    ),
                    Text(
                      'Location: ${hotel.location}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo.shade200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
