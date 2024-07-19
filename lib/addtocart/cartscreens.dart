import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodorderingapp/addtocart/cartscreencomponents/cartbody.dart';
import 'package:foodorderingapp/dashboardscreens/homedashboard.dart';

class Cartscreens extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: buildAppBar(context),
      body: Cartbody(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg",color:Colors.white),
        padding: EdgeInsets.only(left: 10),
        onPressed: (){
          _backpage(context);
        },
      ),
      title: Text("Cart Details",style: TextStyle(color: Colors.white),),
      centerTitle: false,
      actions: [

      ],
    );
  }
  void _backpage(BuildContext context){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Homedashboard()));
  }

}

