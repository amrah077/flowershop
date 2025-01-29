// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'details.dart'; 

class ProductSection extends StatelessWidget {
  final String sectionTitle;
  final List<Map<String, dynamic>> products;

  const ProductSection({
    super.key,
    required this.sectionTitle,
    required this.products,
  });

  Widget buildProductCard(Map<String, dynamic> product, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle card tap
        print('Selected ${product["name"]}');
      },
      child: Card(
        color: Colors.white, 
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Image.asset(
                product['image']!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250, 
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name']!,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product['price']!,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFACB7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFACB7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                    ),
                    onPressed: () {
                      // Navigate to Details page.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(product: product),
                        ),
                      );
                    },
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen orientation
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              sectionTitle,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFA09973),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Products Grid.
          isLandscape
              ? // In landscape mode, 2 in a row grid.
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items per row in landscape
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return buildProductCard(products[index], context);
                  },
                )
              : // In portrait mode, use PageView to display one card at a time.
              SizedBox(
                  height: 350,
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.94),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: buildProductCard(products[index], context),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
