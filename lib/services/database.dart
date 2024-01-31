import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //   collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection('guests');

  Future updateGuestData(Guest guest) async {
    return await users.doc(uid).set({
      'firstName': guest.firstName!,
      'lastName': guest.lastName!,
      'phone': guest.phone,
      'passportNumber': guest.phone!,
      'email': guest.email!,
      'birthDate': guest.birthDate!,
    });
  }

  Future<Guest> fetchGuestData() async {
    DocumentSnapshot doc = await users.doc(uid).get();

    return Guest(
      uid: uid,
      firstName: doc['firstName'],
      lastName: doc['lastName'],
      phone: doc['phone'],
      passportNumber: doc['passportNumber'],
      email: doc['email'],
      birthDate: doc['birthDate'],
    );
  }
}
