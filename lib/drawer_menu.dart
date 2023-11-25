import 'package:flutter/material.dart';
import 'dashboard.dart';

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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(),
          ),
          ListTile(
            title: const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.green,
              size: 30.0,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            leading: const Icon(
              Icons.person,
              color: Colors.green,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Reservations',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            leading: const Icon(
              Icons.list_alt,
              color: Colors.green,
              size: 30.0,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            leading: const Icon(
              Icons.settings,
              color: Colors.green,
              size: 30.0,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
