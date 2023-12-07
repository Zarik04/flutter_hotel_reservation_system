import 'package:flutter/material.dart';

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
              const SizedBox(height: 8),
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
              const SizedBox(height: 8,),
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
              const SizedBox(height: 8,),
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
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Add logic to navigate to reservation history or other pages
                },
                child: const Text('View Reservation History'),
              ),
              // Add more buttons or widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
