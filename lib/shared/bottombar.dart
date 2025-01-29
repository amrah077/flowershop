// ignore_for_file: prefer_const_constructors, use_super_parameters, unused_import, dead_code, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this import
import 'homepage.dart';
import 'allproducts.dart';
import 'aboutus.dart';
import 'contact.dart';
import 'wishlist.dart';
import 'cart.dart';
import 'login.dart'; // Login page

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  // Updated function to check login status
  Future<void> checkLoginStatusAndNavigate(BuildContext context, String page) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; // Check actual login status

    if (isLoggedIn) {
      if (page == 'wishlist') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Wishlist()),
        );
      } else if (page == 'cart') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
      }
    } else {
      // Prompt user to log in
      showDialog(
         context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white, 
              title: Text(
                'Login Required',
                style: TextStyle(
                  fontFamily: 'Roboto', 
                ),
              ),
              content: Text(
                'Please log in to access the Wishlist/Cart.',
                style: TextStyle(
                  fontFamily: 'Roboto', 
                ),
              ),
            );
          },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFFFACB7),
      unselectedItemColor: const Color(0xFFA09973),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AllProductsPage()),
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AboutUsPage()),
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ContactPage()),
            );
            break;
          case 4:
            checkLoginStatusAndNavigate(context, 'wishlist');
            break;
          case 5:
            checkLoginStatusAndNavigate(context, 'cart');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contact',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
    );
  }
}
