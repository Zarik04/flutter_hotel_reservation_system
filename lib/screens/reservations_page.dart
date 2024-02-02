import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/reservation.dart';
import 'package:flutter_hotel_reservation_system/services/providers/reservation_provider.dart';
import 'package:provider/provider.dart';
import '../widget_items/drawer_menu.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late List<Reservation> reservations;
  late List<Item> _data;

  // Track the selected reservation
  Item? selectedReservation;
  @override
  void initState() {
    super.initState();
    reservations = Provider.of<ReservationProvider>(context, listen: false).reservations;
    _data = generateItems(reservations);
    // Set the default selected reservation to the non-active reservation
    selectedReservation = _data.firstWhere(
      (item) => item.headerValue == 'Active Reservation',
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<Reservation> reservations = Provider.of<ReservationProvider>(context).reservations;
    for (var res in reservations){
      print('Room No: ${res.roomId}');
    }
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
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        title: const Text(
          'Reservations',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Find the active reservation
                  Item activeReservation = _data.firstWhere(
                    (item) => item.headerValue == 'Active Reservation',
                  );

                  // Set the selected reservation
                  setState(() {
                    selectedReservation = activeReservation;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text('Show Active Reservation'),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () {
                  // Find the non-active reservation
                  Item nonActiveReservation = _data.firstWhere(
                    (item) => item.headerValue == 'Passive Reservation',
                  );

                  // Set the selected reservation
                  setState(() {
                    selectedReservation = nonActiveReservation;
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrange,
                ),
                child: const Text('Show Non-Active Reservation'),
              ),

              const SizedBox(height: 16),

              // Show details of the selected reservation using a Card
              if (selectedReservation != null)
                Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListTile(
                        title: Text(
                          selectedReservation!.headerValue,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.deepPurple,
                          ),
                        ),
                        subtitle: Text(
                          selectedReservation!.expandedValue,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ),
                      for (Reservation res in selectedReservation!.reservations!)
                        HotelTile(roomNo: res.roomId, roomType: res.roomType,),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelTile extends StatelessWidget {
  final String roomNo, roomType;

  const HotelTile({super.key, required this.roomNo, required this.roomType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      leading: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('img/hotel1.jpg'), // Replace with your image
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        'Room No: $roomNo',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Room Type: $roomType', style: const TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward, color: Colors.deepPurple),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.reservations,
  });

  String expandedValue;
  String headerValue;
  List<Reservation>? reservations;
}

List<Item> generateItems(List<Reservation> reservations) {
  return [
    Item(
      headerValue: 'Active Reservation',
      expandedValue: 'Where you want to stay?',
      reservations: reservations,
    ),
    Item(
      headerValue: 'Passive Reservation',
      expandedValue: 'List of hotels you have been to',
      reservations: [],
    ),
  ];
}

List<String> generateRandomHotels(int count) {
  List<String> hotels = [];
  for (int i = 1; i <= count; i++) {
    hotels.add('Hotel $i');
  }
  return hotels;
}
