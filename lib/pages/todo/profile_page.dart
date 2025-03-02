import 'package:flutter/material.dart';
import 'package:buzzme/widgets/bottom_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700, // Yellow tint
        iconTheme: const IconThemeData(color: Colors.purple), // Purple icons
        title: Row(
          children: [
            Image.asset('assets/buzz_logo.png', height: 40), // Logo on left
            const SizedBox(width: 10),
            const Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Purple text
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView( // Fixes Overflow
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Picture + Username + Email
            const Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_picture.png'), // Change to your image
                  ),
                  SizedBox(height: 10),
                  Text(
                    "John Doe",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "john.doe@email.com",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            // Settings List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  _buildListTile(Icons.person, "Edit Profile", context),
                  _buildListTile(Icons.lock, "Change Password", context),
                  _buildListTile(Icons.notifications, "Notification Settings", context),
                  _buildListTile(Icons.logout, "Logout", context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0), // No tab selected
    );
  }

  // Helper method to build ListTile
  Widget _buildListTile(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      onTap: () {
      },
    );
  }
}

