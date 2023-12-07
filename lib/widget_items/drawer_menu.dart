import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/screens/login_page.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu_items.dart';
import '../screens/dashboard.dart';
import '../screens/profile_page.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 250,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              accountName: Text(
                'Alan Walker',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                'sample@example.com',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage('img/ava.jpg'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              currentAccountPictureSize: Size(100.0, 100.0),
            ),
          ),
          const SizedBox(height: 18.0),
          const DrawerItem(
              itemName: 'Dashboard',
              iconName: Icons.home_rounded,
              routeToPage: DashboardPage()),
          DrawerItem(
            itemName: 'Profile',
            iconName: Icons.person_rounded,
            routeToPage: ProfilePage(
              guest: Guest(
                firstName: 'Alan',
                lastName: 'Walker',
                imagePath: 'img/ava.jpg',
                email: 'sample@example.com',
                phone: '+12345678554',
                password: 'strong_password'
              ),
            ),
          ),
          const DrawerItem(
            itemName: 'Reservations',
            iconName: Icons.list_alt_rounded,
            routeToPage: ReservationScreen(),
          ),
          const DrawerItem(
            itemName: 'Help',
            iconName: Icons.help_rounded,
            routeToPage: DashboardPage(),
          ),
          const DrawerItem(
            itemName: 'Log Out',
            iconName: Icons.exit_to_app_rounded,
            routeToPage: LoginPage(),
          ),
        ],
      ),
    );
  }
}
