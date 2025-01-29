// wishlist.dart

// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flowershop/shared/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // To decode the product data
import 'details.dart'; // Import the Details page

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  List<Map<String, dynamic>> wishlistProducts = [];

  @override
  void initState() {
    super.initState();
    loadWishlist(); // Load wishlist items when the page is initialized
  }

  // Function to load wishlist items from SharedPreferences
  void loadWishlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList('wishlist') ?? [];

    setState(() {
      // Explicitly cast the result of jsonDecode to List<Map<String, dynamic>>
      wishlistProducts = wishlist
          .map((item) => Map<String, dynamic>.from(jsonDecode(item))) // Ensure proper casting
          .toList();
    });
  }

  // Function to remove an item from the wishlist and update SharedPreferences
  void removeItem(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    wishlistProducts.removeAt(index);  // Remove the item from the list
    List<String> updatedWishlist = wishlistProducts
        .map((item) => jsonEncode(item))
        .toList();
    await prefs.setStringList('wishlist', updatedWishlist);  // Update the wishlist in SharedPreferences
    setState(() {});  // Refresh the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        backgroundColor: Color(0xFFFFACB7), 
        iconTheme: IconThemeData(color: Color(0xFFA09973)), // Match the color scheme
      ),
      backgroundColor: Colors.white, // Set the background color to white
      body: wishlistProducts.isEmpty
          ? Center(
              child: Text(
                'Your wishlist is empty!',
                style: TextStyle(fontSize: 18, color: Color(0xFFA09973)),
              ),
            )
          : ListView.builder(
              itemCount: wishlistProducts.length,
              itemBuilder: (context, index) {
                final product = wishlistProducts[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.asset(
                      product['image']!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      product['name']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      "Price: ${product['price']}",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Color(0xFFA09973),
                      ),
                      onPressed: () {
                        removeItem(index);  // Remove the item when clicked
                      },
                    ),
                    onTap: () {
                      // Navigate to the product details page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(product: product),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            bottomNavigationBar: BottomNavBar(),
    );
  }
}
