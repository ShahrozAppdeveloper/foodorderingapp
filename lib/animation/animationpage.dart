import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodorderingapp/dashboardscreens/homedashboard.dart';
import 'package:lottie/lottie.dart';

class Animationpage extends StatefulWidget{
  @override
  State<Animationpage> createState() => _AnimationpageState();
}

class _AnimationpageState extends State<Animationpage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Fluttertoast.showToast(
        msg: "Payment successfully done",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homedashboard()));
        // Navigate to the home dashboard
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset('assets/animations/payment_animations.json'),  // Replace with your animation file
      ),
    );
  }
}