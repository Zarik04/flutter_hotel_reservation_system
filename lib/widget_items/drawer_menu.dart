import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/screens/login_page.dart';
import 'package:flutter_hotel_reservation_system/widget_items/drawer_menu_items.dart';
import '../screens/dashboard.dart';

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
        children: const [
          SizedBox(
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
          SizedBox(height: 18.0),

          DrawerItem(
              itemName: 'Dashboard',
              iconName: Icons.home_rounded,
              routeToPage: DashboardPage()
          ),

          DrawerItem(
              itemName: 'Profile',
              iconName: Icons.person_rounded,
              routeToPage: DashboardPage(),
          ),

          DrawerItem(
            itemName: 'Reservations',
            iconName: Icons.list_alt_rounded,
            routeToPage: DashboardPage(),
          ),

          DrawerItem(
            itemName: 'Help',
            iconName: Icons.help_rounded,
            routeToPage: DashboardPage(),
          ),

          DrawerItem(
            itemName: 'Log Out',
            iconName: Icons.exit_to_app_rounded,
            routeToPage: LoginPage(),
          ),

        ],
      ),
    );
  }
}
