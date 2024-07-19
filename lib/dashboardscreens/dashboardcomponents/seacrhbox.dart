import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Seacrhbox extends StatelessWidget{
  final ValueChanged<String> onChanged;

  const Seacrhbox({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.white),
          hintText: 'Search',
          border: InputBorder.none,
        ),
      ),
    );
  }

}