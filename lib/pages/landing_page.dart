import 'package:flutter/material.dart';
import 'package:buzzme/methods/tokenstorage_handler.dart';
import 'package:buzzme/pages/home_page.dart';
import 'package:buzzme/pages/login_page.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  _LandingPageState createState() => _LandingPageState();

}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _checkLoginStatus();
    });
  }

  Future<void> _checkLoginStatus() async {
    String? token = await TokenstorageHandler.getToken();

    if (token != null && _isTokenValid(token)) {
      // User is already logged in, navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
    } else {
      // User is not logged in, show the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  bool _isTokenValid (String token) {
    // TODO: Implement JWT token validation (decode & check expiry)
    return token.isNotEmpty;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/buzz_logo.png', height: 300),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}



