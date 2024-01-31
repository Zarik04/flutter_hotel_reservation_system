import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/services/database.dart';

class UserProvider with ChangeNotifier {
  Guest _guest = Guest();

  Guest get guest {
    return _guest;
  }

  Future<void> fetchUser(String uid) async {
    Guest guest = Guest();

    try {
      guest = await DatabaseService(uid: uid).fetchGuestData();
    } catch (e) {
      print(e);
    }

    // Parse the response and add the hotels to loadedHotels
    _guest = guest;
    notifyListeners();
  }

  void clean() {
    _guest = Guest();
    notifyListeners();
  }
}
