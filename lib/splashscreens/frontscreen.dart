import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodorderingapp/splashscreens/initailscreens.dart';

import '../onboardingscreens/onboardingscreen.dart';

class Frontscreen extends StatefulWidget {
  @override
  State<Frontscreen> createState() => _FrontscreenState();
}

class _FrontscreenState extends State<Frontscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => InitialScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(child: Image.asset("assets/images/food.jpeg")),
          ),
        ],
      ),
    );
  }
}
