import 'package:cloud_firestore/cloud_firestore.dart';

class Reservation {
  final String hotelId;
  final String roomId;
  final String roomType;
  final DateTime startDate;
  final DateTime endDate;

  Reservation({
    required this.hotelId,
    required this.roomId,
    required this.roomType,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'hotelId': hotelId,
      'roomId': roomId,
      'roomType': roomType,
      'startDate': startDate,
      'endDate': endDate,
    };
  }

  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      hotelId: map['hotelId'],
      roomId: map['roomId'],
      roomType: map['roomType'],
      startDate: (map['startDate'] as Timestamp).toDate(),
      endDate: (map['endDate'] as Timestamp).toDate(),
    );
  }
}
