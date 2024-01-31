import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';
import 'package:flutter_hotel_reservation_system/services/hotel_db.dart';

class HotelProvider with ChangeNotifier {
  List<Hotel> _hotels = [];

  List<Hotel> get hotels {
    return [..._hotels];
  }

  Future<void> fetchHotels() async {

    final List<Hotel> loadedHotels = [];

    try {
      List<Hotel> hotels = await HotelDatabase.getHotels();
      for (var hotel in hotels) {
        loadedHotels.add(hotel);
        // print('Name: ${hotel.name} Image: ${hotel.imageUrl}\n');
      }
    } catch (e) {
      print(e);
    }

    // Parse the response and add the hotels to loadedHotels
    _hotels = loadedHotels;
    notifyListeners();
  }

  void clean() {
    _hotels = [];
    notifyListeners();
  }
}
