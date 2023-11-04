import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/Second.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _HomeScState();
}

class _HomeScState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 251, 255),
      body: Stack(
        children: [
          
          const Positioned(
            top: 105,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    'Hoteleum',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    '"Welcome to Hotel Reservaation System"',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 45, 68, 46),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/intro.png.png'),
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
                  primary: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondS()),
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