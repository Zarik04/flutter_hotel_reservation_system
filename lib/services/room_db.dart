import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hotel_reservation_system/models/room.dart';

class RoomDatabase {
  // Add room to Firestore
  static Future<void> addRoom(String hotelId, Room room) async {
    final ref = FirebaseFirestore.instance.collection('rooms').doc(hotelId);

    return ref.set({
      room.roomNo: room.toMap(),
    }, SetOptions(merge: true));
  }

  // Get rooms from Firestore
  static Future<List<Room>> getRooms(String hotelId) async {
    final ref = FirebaseFirestore.instance.collection('rooms').doc(hotelId);

    DocumentSnapshot snapshot = await ref.get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return data.entries.map((entry) {
      return Room.fromMap(hotelId, entry.value);
    }).toList();
  }


}
