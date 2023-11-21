import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Part 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Part 2'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Part 3'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Part 4'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
