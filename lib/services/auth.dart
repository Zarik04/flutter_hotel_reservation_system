import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/services/database.dart';

// import 'package:lab_11_main/models/user.dart';
// import 'package:lab_11_main/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Guest? _userFromFirebaseUser(User? user) {
    return user != null ? Guest(uid: user.uid, email: user.email) : null;
  }

  Future registerWithEmailAndPassword(Guest guest) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: guest.email!, password: guest.password!);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateGuestData(
        guest.firstName!,
        guest.lastName!,
        guest.phone!,
        guest.passportNumber!,
        guest.email!,
        guest.birthDate!,
      );
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}