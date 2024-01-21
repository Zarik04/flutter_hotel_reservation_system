import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/intro_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hotel_reservation_system/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
