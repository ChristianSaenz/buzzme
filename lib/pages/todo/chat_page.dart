import 'package:flutter/material.dart';
import 'package:buzzme/pages/todo/profile_page.dart';
import 'package:buzzme/widgets/bottom_nav_bar.dart';


class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade700,
        iconTheme: IconThemeData(color: Colors.purple),

        title: Row(
          children: [
            const Text(
              "CHAT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10), // Space between text and search bar
            Expanded(
              child: Container(
                height: 40, // Adjust height for better look
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1), // Light opacity to blend
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none, // Remove outer border
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
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
      body: const Center(child: Text("Groups go here!")),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
    );
  }
}

