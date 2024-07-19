import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodorderingapp/addtocart/cartscreencomponents/cartitemdesign.dart';
import 'package:foodorderingapp/animation/animationpage.dart';

class Cartbody extends StatelessWidget {
  Future<List<Map<String, dynamic>>> fetchCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return [];
    }

    final cartItems = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('cart')
        .get();

    return cartItems.docs.map((doc) => doc.data()).toList();
  }

  Future<void> deleteCartItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    final cartCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('cart');

    final cartItems = await cartCollection.get();
    for (var doc in cartItems.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchCartItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No items in cart', style: TextStyle(color: Colors.white)),
            );
          }

          final cartItems = snapshot.data!;
          // final totalPrice = cartItems.fold(0, (total, item) {
          //   final quantity = item['quantity'] ?? 1;
          //   return total + item['price'] * quantity;
          // });

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartItemDesign(
                      imageUrl: item['image'],
                      name: item['name'],
                      price: item['price'],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await deleteCartItems();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Animationpage()), // Replace NextPage() with your next page
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Pay Now'),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

