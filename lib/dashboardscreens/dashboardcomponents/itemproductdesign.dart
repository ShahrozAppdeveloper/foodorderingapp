import 'package:flutter/material.dart';
import 'package:foodorderingapp/model/products.dart';

import '../../detailscreen/productdetails.dart';

class Itemproductdesign extends StatelessWidget {
  final Products product;

  Itemproductdesign({required this.product});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double itemWidth = (screenWidth < 600) ? screenWidth / 2 - 20 : screenWidth / 4 - 20; // Adjust item width based on screen width

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Productdetails(products: product,),
          ),
        );
      },
      child: Container(
        width: itemWidth,
        height: itemWidth * 3.5, // Adjust height to increase overall container height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.4),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0), // Add padding around the image
                  child: Container(
                    width: double.infinity,
                    height: itemWidth * 0.75, // Adjust image height based on item width
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 30, // Set desired height
                width: 60, // Set desired width
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.orange,
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '\$${product.price}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
