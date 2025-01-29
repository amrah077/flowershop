// productcard.dart

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'details.dart'; // Import the Details widget file (update the path if needed)

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0), // Add vertical padding between cards
      child: GestureDetector(
        onTap: () {
          // Log the product selected
          print('Selected product: ${product['name']}');
        },
        child: Card(
          color: Colors.white, // Set card background to white
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.asset(
                  product['image'] ?? 'assets/images/default.jpg', // Fallback to default image if null
                  fit: BoxFit.cover,
                ),
              ),

              // Product Details
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product['name'] ?? 'Unknown Product',
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Product Price
                    Text(
                      'Rs. ${product['price'] ?? 'Price not available'}',
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFACB7),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Product Description (Short preview for the card)
                    Text(
                      product['description'] ?? 'No description available',
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      maxLines: 2, // Limit to 2 lines to keep it brief
                      overflow: TextOverflow.ellipsis, // Adds an ellipsis if the text is too long
                    ),
                    const SizedBox(height: 8),

                    // View Details Button
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
                        if (product.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Details(product: product),
                            ),
                          );
                        } else {
                          print('Product data is invalid');
                        }
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
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}
