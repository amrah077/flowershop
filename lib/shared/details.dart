// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, library_private_types_in_public_api

import 'package:flowershop/shared/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navbar.dart';
import 'dart:convert';
import 'login.dart';  

class Details extends StatefulWidget {
  final Map<String, dynamic> product;

  const Details({
    super.key,
    required this.product,
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isAddedToWishlist = false;
  int quantity = 1;
  double _imageScale = 1.0;
  String displayedPrice = ""; // Variable to store the price (medium or large).
  Map<String, dynamic> currentProduct = {};

  @override
  void initState() {
    super.initState();
    currentProduct = widget.product;
    displayedPrice = widget.product['price'] ?? 'Price not available';
    _loadWishlistState();
  }

  void _loadWishlistState() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlist = prefs.getStringList('wishlist') ?? [];
    final isInWishlist = wishlist.any((item) => jsonDecode(item)['id'] == widget.product['id']);
    setState(() {
      isAddedToWishlist = isInWishlist;
    });
  }

  void _saveWishlistState() async {
    final prefs = await SharedPreferences.getInstance();
    final wishlist = prefs.getStringList('wishlist') ?? [];
    
    if (isAddedToWishlist) {
      wishlist.add(jsonEncode(currentProduct));
    } else {
      wishlist.removeWhere((item) => jsonDecode(item)['id'] == currentProduct['id']);
    }
    
    prefs.setStringList('wishlist', wishlist);
  }

  void _checkLoginAndAddToCart() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      // Add to cart if the user is logged in
      final cartItem = {
        'id': currentProduct['id'],
        'name': currentProduct['name'],
        'price': displayedPrice,
        'quantity': quantity,
        'image': currentProduct['image'],
        'description': currentProduct['description'], 
      };

      final cart = prefs.getStringList('cart') ?? [];
      cart.add(jsonEncode(cartItem));  // Add the cart item to the cart list
      await prefs.setStringList('cart', cart);  // Save the updated cart

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${currentProduct['name']} added to cart"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      // Show login popup if not logged in.
      showDialog(
        context: context,
        builder: (context) => LoginPopup(
          onSignupClicked: () {
          },
          onClose: () {
            Navigator.pop(context); 
          },
          onSwitchToSignup: () {
            // Handle switching to signup page.
          },
        ),
      );
    }
  }

  // load product based on selected color.
void _loadProductByColor(String color) {
  // Simulate the new product data based on selected color
  Map<String, dynamic> newProduct = {
    'id': widget.product['id'],
    'name': '${widget.product['flower']} $color',
    'category': widget.product['category'],
    'flower': widget.product['flower'],
    'color': color,
    'price': widget.product['price'],
    'largeprice': widget.product['largeprice'],
    'image': 'assets/products/${widget.product['flower']}${color.toLowerCase()}.webp', 
    'description': 'A beautiful ${widget.product['flower']} flower in $color.',
  };

  // Update current product and displayed price based on selected size
  setState(() {
    currentProduct = newProduct;
    displayedPrice = currentProduct['price'];  // Reset to base price when color is changed
    _imageScale = 1.0;  // Reset image scale
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Navbar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      _imageScale = (_imageScale + details.localPosition.dy / 500).clamp(1.0, 2.0);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Transform.scale(
                      scale: _imageScale,
                      child: Image.asset(
                        currentProduct['image'] ?? 'assets/products/default.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                currentProduct['name'] ?? 'Unknown Product',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price: Rs. $displayedPrice",
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFACB7),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isAddedToWishlist = !isAddedToWishlist;
                        _saveWishlistState();
                        if (isAddedToWishlist) {
                          print('Added to wishlist: ${currentProduct['name']}');
                        } else {
                          print('Removed from wishlist: ${currentProduct['name']}');
                        }
                      });
                    },
                    icon: Icon(
                      isAddedToWishlist ? Icons.favorite : Icons.favorite_border,
                      color: isAddedToWishlist ? Colors.red : Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "Description: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                currentProduct['description'] ?? 'No description available',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                "Size: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          displayedPrice = currentProduct['price'] ?? 'Price not available';
                          _imageScale = 1.0;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFACB7),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Medium',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          displayedPrice = currentProduct['largeprice'] ?? 'Price not available';
                          _imageScale = 1.5;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFACB7),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Large',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (currentProduct['category'] == 'single') 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _loadProductByColor('Pink'),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.pink,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _loadProductByColor('White'),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _loadProductByColor('Red'),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _loadProductByColor('Yellow'),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 16),
              Text(
                "Quantity: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--;
                      });
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Color(0xFFFFACB7),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFFACB7), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$quantity',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Color(0xFFFFACB7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _checkLoginAndAddToCart,  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFACB7),
                    padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Add To Cart', style: TextStyle(color: Colors.white)),
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
