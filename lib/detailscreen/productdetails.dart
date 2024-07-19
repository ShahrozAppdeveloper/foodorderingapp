import 'package:flutter/material.dart';
import 'package:foodorderingapp/detailscreen/components/detailsbody.dart';
import 'package:foodorderingapp/model/products.dart';

class Productdetails extends StatelessWidget {
  final Products products;

  const Productdetails({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductDetails",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.black, // Set the background color of the app bar
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:Colors.white ,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Detailsbody(product: products),
      backgroundColor: Colors.black,
    );
  }
}
