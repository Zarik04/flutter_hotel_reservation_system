import 'package:flutter/material.dart';
import 'package:flutter_hotel_reservation_system/drawer_menu.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Dashboard'),
      ),
      body: const Center(
        child: Text('Dashboard Content'),
      ),
      drawer: const DrawerMenu(),
    );
  }
}
