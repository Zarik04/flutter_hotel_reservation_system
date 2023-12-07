import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';

import '../models/guest.dart';
import '../widget_items/drawer_menu.dart';

class ProfilePage extends StatelessWidget {
  final Guest guest;
  static const Color labelThemeColor = Colors.deepPurple;
  static Color valueThemeColor = Colors.indigo.shade400;

  const ProfilePage({super.key, required this.guest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Profile Page'),
      ),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(guest.imagePath),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  const Text(
                    'First Name:',
                    style: TextStyle(
                      color: labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    guest.firstName,
                    style: TextStyle(
                      fontSize: 25,
                      color: valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'Last Name:',
                    style: TextStyle(
                      color: labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    guest.lastName,
                    style: TextStyle(
                      fontSize: 25,
                      color: valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  const Text(
                    'Email:',
                    style: TextStyle(
                      color: labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    guest.email,
                    style: TextStyle(
                      fontSize: 20,
                      color: valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  const Text(
                    'Phone:',
                    style: TextStyle(
                      color: labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    guest.phone,
                    style: TextStyle(
                      fontSize: 20,
                      color: valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  const Text(
                    'Password:',
                    style: TextStyle(
                      color: labelThemeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    '*'*guest.password.length,
                    style: TextStyle(
                      fontSize: 20,
                      color: valueThemeColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 15,),
                  IconButton.filled(
                    onPressed: (){

                    },
                    icon: Icon(
                      Icons.visibility,
                    ),

                  )
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: labelThemeColor,
                  padding: const EdgeInsets.all(15.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReservationScreen()),
                  );
                },
                child: const Text('View Reservation History'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
