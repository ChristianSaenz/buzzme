import 'package:buzzme/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:buzzme/pages/todo/profile_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.purple),
        backgroundColor: Colors.amber.shade700,
        title: Row(
          children: [
            Image.asset('assets/buzz_logo.png', height: 40),
            const SizedBox(width: 25),
            const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ))
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              }
          )
        ],
      ),
      body: Center(child: Text("Groups go here!")),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0),
    );
  }
}

