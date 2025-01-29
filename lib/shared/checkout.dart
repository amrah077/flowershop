// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field

import 'package:flowershop/shared/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List<Map<String, dynamic>> cartItems = [];
  double totalAmount = 0.0;

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phone = '';
  String _address = '';

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  void _loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cart = prefs.getStringList('cart') ?? [];

    // Parse the cart items and calculate the total price.
    setState(() {
      cartItems = cart.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();
      totalAmount = cartItems.fold(
        0.0,
        (sum, item) =>
            sum + (double.parse(item['price']) * int.parse(item['quantity'].toString())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFFFACB7), 
        iconTheme: IconThemeData(color: Color(0xFFA09973)), 
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty!',
                style: TextStyle(fontSize: 18, color: Color(0xFFA09973)),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Cart Items
                    Text(
                      'Cart Items',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return ListTile(
                          leading: item['image'] != null
                              ? Image.asset(
                                  item['image'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                )
                              : Icon(Icons.shopping_cart, color: Color(0xFFA09973)),
                          title: Text(item['name'] ?? 'Unknown Item'),
                          subtitle: Text(
                            'Quantity: ${item['quantity']} | Rs. ${(double.parse(item['price']) * int.parse(item['quantity'].toString())).toStringAsFixed(2)}',
                          ),
                        );
                      },
                    ),
                    Divider(),
                    // Total Price
                    Text(
                      'Total: Rs. ${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    // Customer Information Form
                    Text(
                      'Customer Information',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              labelStyle: TextStyle(color: Color(0xFFA09973)),
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) => _name = value!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              labelStyle: TextStyle(color: Color(0xFFA09973)),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            onSaved: (value) => _phone = value!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                                return 'Please enter a valid phone number';
                              }
                              if (value.length != 10) {
                                return 'Phone number must be 10 digits';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Delivery Address',
                              labelStyle: TextStyle(color: Color(0xFFA09973)),
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (value) => _address = value!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your delivery address';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Handle order confirmation
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.white, 
                                      title: Text('Order Confirmed'),
                                      content: Text(
                                          'Thank you $_name! Your order has been placed. We will deliver it to $_address soon.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFFFACB7),
                              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Confirm Order',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavBar(),
    );
  }
}
