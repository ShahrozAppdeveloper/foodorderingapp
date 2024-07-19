import 'package:flutter/material.dart';

class Onboaringcontent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final TextStyle titleStyle;

  const Onboaringcontent({
    required this.image,
    required this.title,
    required this.description,
    required this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: titleStyle, // Use the provided titleStyle here
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 70),
      ],
    );
  }
}
