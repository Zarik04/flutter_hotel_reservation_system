import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';
import 'package:flutter_hotel_reservation_system/services/room_db.dart';

class RoomProvider with ChangeNotifier {
  List<Room> _rooms = [];

  List<Room> get rooms {
    return [..._rooms];
  }

  Future<void> fetchRooms(String hotelId) async {

    final List<Room> loadedRooms = [];

    try {
      List<Room> rooms = await RoomDatabase.getRooms(hotelId);
      for (var room in rooms) {
        loadedRooms.add(room);
        print('Room No: ${room.roomNo} Price: ${room.price}\n');
      }
    } catch (e) {
      print(e);
    }

    _rooms = loadedRooms;
    notifyListeners();
  }

  void clean() {
    _rooms = [];
    notifyListeners();
  }
}