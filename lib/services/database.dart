import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  //   collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection('guests');

  Future updateGuestData(
    String firstName,
    lastName,
    phone,
    passportNumber,
    email,
    birthDate,
  ) async {
    return await users.doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'passportNumber': passportNumber,
      'email': email,
      'birthDate': birthDate,
    });
  }

  Future<DocumentSnapshot> fetchGuestData() async {
    return await users.doc(uid).get();
  }

}
