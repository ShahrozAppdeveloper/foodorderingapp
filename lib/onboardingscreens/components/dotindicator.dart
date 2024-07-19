import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dotindicator extends StatelessWidget{
 final  bool isActive;

  const Dotindicator({this.isActive=false});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive? 17 :4,
      width: 10,
      decoration: BoxDecoration(
          color: isActive? Colors.orange:Colors.orange.withOpacity(0.4),
          borderRadius: BorderRadius.circular(12)
      ),
    );
  }

}