// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print

import 'package:flowershop/shared/bottombar.dart';
import 'package:flowershop/shared/checkout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'details.dart'; 

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  void _loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cart = prefs.getStringList('cart') ?? [];
    setState(() {
      cartItems = cart.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
    });
  }

  // Remove an item from the cart and update SharedPreferences.
  void _removeItem(int index) async {
    final prefs = await SharedPreferences.getInstance();
    cartItems.removeAt(index); // Remove the item from the list
    final updatedCart = cartItems.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('cart', updatedCart); // Update the cart in SharedPreferences.
    setState(() {}); // Refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Color(0xFFA09973)), 
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, color: Color(0xFFA09973)),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                // Debug to check if largeprice exists
                print('Cart Item: ${item['name']}, Large Price: ${item['largeprice']}');

                return ListTile(
                  leading: item['image'] != null
                      ? Image.asset(
                          item['image'], 
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.shopping_cart,
                          color: Color(0xFFA09973),
                        ),
                  title: Text(item['name'] ?? 'Unknown Item'),
                  subtitle: Text(
                      'Quantity: ${item['quantity']} | Rs. ${item['price']}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Color(0xFFA09973),
                    ),
                    onPressed: () {
                      _removeItem(index); // Remove the item when icon clicked.
                    },
                  ),
                  onTap: () {
                    // Ensure largeprice exists in the product map
                    final productWithLargePrice = {
                      ...item,
                      'largeprice': item['largeprice'] ?? 'Not Available', // Fallback for largeprice
                    };

                    // Debugging to verify product details passed to Details page
                    print('Navigating to Details with product: $productWithLargePrice');

                    // Navigate to the details page when the product is pressed.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          product: productWithLargePrice, // Pass the updated product data to the details page.
                        ),
                      ),
                    );
                  },
                );
              },
            ),
      //checkout- FLOATING ACTION BUTTON !!!
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CheckoutPage()), 
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.shopping_cart_checkout,
            color: Colors.white, 
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
