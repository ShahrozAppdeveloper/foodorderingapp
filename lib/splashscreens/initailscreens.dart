import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodorderingapp/dashboardscreens/homedashboard.dart';
import 'package:foodorderingapp/onboardingscreens/onboardingscreen.dart';
// Import the Home dashboard screen

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  void _checkAuthStatus() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Onboardingscreen()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Homedashboard()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator while checking auth status
      ),
    );
  }
}
