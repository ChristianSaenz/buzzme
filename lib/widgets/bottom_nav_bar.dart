import 'package:flutter/material.dart';
import 'package:buzzme/pages/home_page.dart';
import 'package:buzzme/pages/todo/chat_page.dart';
import 'package:buzzme/pages/todo/notifications_page.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    Widget page;
    switch (index) {
      case 0:
        page = HomePage();
        break;
      case 1 :
        page = ChatPage();
        break;
      case 2:
        page = NotificationsPage();
        break;
      default:
        page = HomePage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.amber.shade700,
      selectedItemColor: Colors.purple.shade400,
      unselectedItemColor: Colors.deepPurple,
        currentIndex: currentIndex,
        onTap: (index) => _onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications")
        ],
    );
  }
}
