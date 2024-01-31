import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future _userFromFirebaseUser(User? user) async {
    if (user != null) {
      Guest guest = await DatabaseService(uid: user.uid).fetchGuestData();
      return guest;
    }

    return null;
  }

  Future registerWithEmailAndPassword(Guest guest) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: guest.email!, password: guest.password!);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateGuestData(guest);
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
