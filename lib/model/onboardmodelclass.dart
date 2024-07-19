import 'package:flutter/material.dart';

class Onboardmodelclass{
  final String image,title,description;
  final TextStyle titleStyle;

  Onboardmodelclass({required this.image, required this.title, required this.description, required this.titleStyle});



}
final List<Onboardmodelclass> demolist = [
  Onboardmodelclass(
    image: "assets/images/foodwithperson.jpeg",
    title: "Delicious food delivered to your \ndoorstep with just a click!",
    description:
    "Discover the convenience of our online food app, where delicious meals are just a click away.",
    titleStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Sen', // Replace with your actual font family
    ),
  ),
  Onboardmodelclass(
    image: "assets/images/bikeimage.jpeg",
    title: "Delicious food delivered to your \ndoorstep with just a click!",
    description:
    "Discover the convenience of our online food app, where delicious meals are just a click away.",
    titleStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Sen', // Replace with your actual font family
    ),
  ),
  Onboardmodelclass(
    image: "assets/images/foodwithperson.jpeg",
    title: "Delicious food delivered to your \ndoorstep with just a click!",
    description:
    "Discover the convenience of our online food app, where delicious meals are just a click away.",
    titleStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: 'Sen', // Replace with your actual font family
    ),
  ),
];
