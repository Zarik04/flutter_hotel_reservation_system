import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hotel_reservation_system/models/reservation.dart';

class ReservationDatabase {
  // Add reservation to Firestore
  static Future<void> addReservation(
      String userId, Reservation reservation) async {
    final ref =
        FirebaseFirestore.instance.collection('reservations').doc(userId);

    return ref.set({
      reservation.roomId: reservation.toMap(),
    }, SetOptions(merge: true));
  }

  // Get reservations from Firestore
  static Future<List<Reservation>> getReservations(String userId) async {
    final ref =
        FirebaseFirestore.instance.collection('reservations').doc(userId);

    DocumentSnapshot snapshot = await ref.get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return data.entries.map((entry) {
      return Reservation.fromMap(entry.value);
    }).toList();
  }
}
