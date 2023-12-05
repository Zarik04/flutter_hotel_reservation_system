import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/registration_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _HomeScState();
}

class _HomeScState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 105,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Text(
                    'Hoteleum',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '"Rest In Piece"',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/intro.png'),
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 90,
            right: 16,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
