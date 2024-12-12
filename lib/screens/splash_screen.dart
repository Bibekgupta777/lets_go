
// import 'package:demo_test/screens/home_screen.dart';
// import 'package:demo_test/screens/login_screen.dart';
import 'package:flutter/material.dart';
// Import LoginScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set a delay of 3 seconds before navigating to the LoginScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center all content
          children: [
            // Welcome Text
            Padding(
              padding: const EdgeInsets.only(top: 50.0), // Reduced top padding
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 80),
            // Logo (increased size)
            Image.asset(
              'assets/logo.png', // Place your logo in the assets folder
              height: 200, // Increased size of the logo
            ),
            SizedBox(height: 80), // Add spacing for better UI
          ],
        ),
      ),
    );
  }
}
