import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodorderingapp/addtocart/cartscreens.dart';
import 'package:foodorderingapp/authscreens/signin.dart';
import 'package:foodorderingapp/dashboardscreens/dashboardcomponents/dashboardbody.dart';
import 'package:foodorderingapp/splashscreens/initailscreens.dart';

class Homedashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(context),
      body: Dashboardbody(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        padding: EdgeInsets.only(left: 10),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Dashboard",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {
            _movetonextpage(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/cart_with_item.svg",
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            _logout(context);
          },
          icon: Icon(
            Icons.logout,  // Using built-in logout icon
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Signin()),
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
  void _movetonextpage(BuildContext context){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Cartscreens()));
  }

}