import 'package:flutter/material.dart';
import 'package:buzzme/widgets/bottom_nav_bar.dart';
import 'package:buzzme/pages/todo/profile_page.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        title: Row(
          children: [
            Image.asset('assets/buzz_logo.png', height: 40), // Logo on the left
            const SizedBox(width: 10),
            const Expanded(
              child: Center(
                child: Text(
                  "NOTIFICATIONS",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text("Notifications go here!")),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}
