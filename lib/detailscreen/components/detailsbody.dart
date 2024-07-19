import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:foodorderingapp/model/products.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:fluttertoast/fluttertoast.dart';

class Detailsbody extends StatefulWidget {
  final Products product;

  const Detailsbody({Key? key, required this.product}) : super(key: key);

  @override
  State<Detailsbody> createState() => _DetailsbodyState();
}

class _DetailsbodyState extends State<Detailsbody> {
  int counter = 1;
  String imageUrl = '';

  void increase() {
    setState(() {
      counter += 1;
    });
  }

  void decrease() {
    if (counter > 1) {
      setState(() {
        counter -= 1;
      });
    }
  }

  Future<void> uploadImage() async {
    ByteData byteData = await rootBundle.load(widget.product.image);
    Uint8List imageData = byteData.buffer.asUint8List();

    final storageRef = FirebaseStorage.instance
        .ref()
        .child('product_images/${widget.product.productId}.jpg');

    await storageRef.putData(imageData);
    String downloadUrl = await storageRef.getDownloadURL();

    setState(() {
      imageUrl = downloadUrl;
    });
  }

  Future<void> saveProductDetails() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('cart')
          .add({
        'productId': widget.product.productId,
        'name': widget.product.name,
        'image': imageUrl,
        'price': widget.product.price,
        'quantity': counter,
      });
    } else {
      print('No user logged in.');
    }
  }

  Future<void> addProductToCart() async {
    try {
      await uploadImage();
      await saveProductDetails();
      Fluttertoast.showToast(
        msg: "Added to cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      print('Error: $e');
      Fluttertoast.showToast(
        msg: "Failed to add to cart",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                '\$${widget.product.price.toString()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 325,
                height: 325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.product.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: decrease,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "$counter",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: increase,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                widget.product.productdescription,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 260, // Adjust width as needed
                height: 50, // Adjust height as needed
                child: ElevatedButton.icon(
                  onPressed: addProductToCart,
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20), // Adjust padding as needed
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 18), // Adjust font size as needed
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30), // Adjust button border radius as needed
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
