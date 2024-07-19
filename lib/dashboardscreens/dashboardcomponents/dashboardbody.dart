import 'package:flutter/material.dart';
import 'package:foodorderingapp/contants.dart';
import 'package:foodorderingapp/dashboardscreens/dashboardcomponents/categorylist.dart';
import 'package:foodorderingapp/dashboardscreens/dashboardcomponents/itemproductdesign.dart';
import 'package:foodorderingapp/dashboardscreens/dashboardcomponents/seacrhbox.dart';

import '../../model/products.dart';

class Dashboardbody extends StatefulWidget {
  @override
  State<Dashboardbody> createState() => _DashboardbodyState();
}

class _DashboardbodyState extends State<Dashboardbody> {
  int _selectedIndex = 0;
  late List<Products> filteredProducts;
  late List<Products> allProducts;

  @override
  void initState() {
    super.initState();
    allProducts = List.from(products); // Initialize with all products
    filteredProducts = List.from(products); // Initialize with all products
  }

  void filterProducts(int categoryIndex) {
    setState(() {
      _selectedIndex = categoryIndex;
      if (categoryIndex == 0) {
        // Show all products
        filteredProducts = List.from(allProducts);
      } else {
        // Show products of selected category
        String selectedCategory = categories[categoryIndex];
        filteredProducts = allProducts
            .where((product) => product.typeproduct == selectedCategory)
            .toList();
      }
    });
  }
  void searchProducts(String query) {
    List<Products> searchResults = allProducts.where((product) {
      final productTitleLower = product.name.toLowerCase();
      final searchQueryLower = query.toLowerCase();
      return productTitleLower.contains(searchQueryLower);
    }).toList();

    setState(() {
      filteredProducts = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: screenHeight,
      color: Colors.black,
      child: Column(
        children: [
          Seacrhbox(
          onChanged: (value) {
       searchProducts(value);
    },
     ),
          Categorylist(
            selectedIndex: _selectedIndex,
            onTap: filterProducts,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (screenWidth < 600) ? 2 : 4, // Adjust number of columns based on screen width
                  crossAxisSpacing: 15.0, // Spacing between columns
                  mainAxisSpacing: 15.0, // Spacing between rows
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return Itemproductdesign(product: filteredProducts[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}