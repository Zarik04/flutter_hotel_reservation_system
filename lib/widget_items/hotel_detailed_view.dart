import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';
import 'package:flutter_hotel_reservation_system/services/providers/room_provider.dart';
import 'package:flutter_hotel_reservation_system/widget_items/room_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HotelPage(
        hotelName: 'Sample Hotel',
        image: 'img/hotel_image.jpg',
      ),
    );
  }
}

class HotelPage extends StatelessWidget {
  final String hotelName;
  final String image;

  const HotelPage({super.key, required this.hotelName, required this.image});

  @override
  Widget build(BuildContext context) {
    List<Room> rooms = Provider.of<RoomProvider>(context).rooms;
    List<RoomTypeCard> roomCards = [];
    for (var room in rooms) {
      roomCards.add(RoomTypeCard(
        room,
        const [
          'img/room1.jpg',
          'img/roomw2.jpg',
          'img/room3.jpeg',
          'img/hotel4.jpg',
        ],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          hotelName,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 300.0,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Description of the hotel goes here. Provide information about the amenities, location, etc.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Accommodation Types',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ...roomCards,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
