import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/reservation.dart';
import 'package:flutter_hotel_reservation_system/services/reservation_db.dart';

class ReservationProvider with ChangeNotifier {
  List<Reservation> _reservations = [];

  List<Reservation> get reservations {
    return [..._reservations];
  }

  Future<void> fetchReservations(String userId) async {
    final List<Reservation> loadedReservations = [];

    try {
      List<Reservation> reservations = await ReservationDatabase.getReservations(userId);
      for (var reservation in reservations) {
        loadedReservations.add(reservation);
      }
    } catch (e) {
      print(e);
    }

    _reservations = loadedReservations;
    notifyListeners();
  }

  void clean() {
    _reservations = [];
    notifyListeners();
  }
}