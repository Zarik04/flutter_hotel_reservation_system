import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/models/guest.dart';
import 'package:flutter_hotel_reservation_system/screens/help_screen.dart';
import 'package:flutter_hotel_reservation_system/screens/login_page.dart';
import 'package:flutter_hotel_reservation_system/screens/reservations_page.dart';
import 'package:flutter_hotel_reservation_system/services/auth.dart';
import 'package:flutter_hotel_reservation_system/services/providers/hotel_provider.dart';
import 'package:flutter_hotel_reservation_system/services/providers/user_provider.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu_items.dart';
import 'package:provider/provider.dart';
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
    Guest guest = Provider.of<UserProvider>(context).guest;
    guest.imagePath = 'img/ava.jpg';
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 250,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
              accountName: Text(
                guest.firstName!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                guest.email!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage(guest.imagePath!),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              currentAccountPictureSize: const Size(100.0, 100.0),
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
              guest: guest,
            ),
          ),
          const DrawerItem(
            itemName: 'Reservations',
            iconName: Icons.list_alt_rounded,
            routeToPage: ReservationScreen(),
          ),
          DrawerItem(
            itemName: 'Help',
            iconName: Icons.help_rounded,
            routeToPage: HelpPage(),
          ),
          ListTile(
            title: Text(
              'Log Out',
              style: TextStyle(
                color: Colors.deepPurple.shade300,
                fontWeight: FontWeight.w800,
                fontSize: 16.0,
              ),
            ),
            leading: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.deepPurple,
              size: 30.0,
            ),
            onTap: () async {
              final AuthService _auth = AuthService();
              await _auth.signOut();
              Provider.of<HotelProvider>(context, listen: false).clean();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}
