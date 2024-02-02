import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hotel_reservation_system/models/hotel.dart';

class HotelDatabase {
  // Add hotel to Firestore
  static Future<Future<DocumentReference<Map<String, dynamic>>>> addHotel(Hotel hotel) async {
    final ref = FirebaseFirestore.instance.collection('hotels');

    return ref.add(hotel.toMap());
  }

// Get hotels from Firestore
  static Future<List<Hotel>> getHotels() async {
    final ref = FirebaseFirestore.instance.collection('hotels');

    QuerySnapshot snapshot = await ref.get();

    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Hotel.fromMap(doc.id, data);
    }).toList();
  }

}