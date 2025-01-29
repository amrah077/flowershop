// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sized_box_for_whitespace, use_super_parameters, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'signup.dart';
import 'homepage.dart';
import 'allproducts.dart';
import 'aboutus.dart';
import 'contact.dart';
import 'wishlist.dart';
import 'cart.dart';
import 'logout.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isLogoutPopupOpen = false;

  void _toggleLogoutPopup() {
    setState(() {
      _isLogoutPopupOpen = !_isLogoutPopupOpen;
    });
  }

  Future<void> _checkLoginStatusAndNavigate(String destination) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            switch (destination) {
              case 'wishlist':
                return Wishlist();
              case 'cart':
                return CartPage();
              default:
                return Homepage();
            }
          },
        ),
      );
    } else {
      _showLoginPopup();
    }
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    setState(() {
      _isLogoutPopupOpen = false; // Close the logout popup without rebuilding the page.
    });
  }

  // Function to show the login popup
  void _showLoginPopup() {
    showDialog(
      context: context,
      builder: (context) => LoginPopup(
        onClose: () {
          Navigator.pop(context); // Close the login page.
        },
        onSwitchToSignup: () {
          Navigator.pop(context); // Close the login page and navigate to signup.
          _navigateToSignup(context);
        },
        onSignupClicked: () {
          Navigator.pop(context); // Close the login page and navigate to signup.
          _navigateToSignup(context);
        },
      ),
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: const Color(0xFFFFACB7),
      iconTheme: IconThemeData(color: Color(0xFFA09973)), 
      elevation: 0,
      title: MediaQuery.of(context).orientation == Orientation.landscape
          ? Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Image.asset(
                  'assets/mainimages/logoimg.png',
                  height: 50,
                ),
              ),
            )
          : Image.asset(
              'assets/mainimages/logoimg.png',
              height: 50,
            ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.person,
            color: Color(0xFFA09973),
          ),
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

            if (isLoggedIn) {
              // Show the LogoutPopup
              showDialog(
                context: context,
                builder: (context) => LogoutPopup(
                  onLogout: () async {
                    await prefs.setBool('isLoggedIn', false); 
                  },
                  onClose: () {
                    Navigator.pop(context); 
                  },
                ),
              );
            } else {
              _showLoginPopup();
            }
          },
        ),
      ],
    ),
  );
}


  Widget _buildMenuItem(String title, IconData icon, VoidCallback action) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFA09973)),
      title: Text(
        title,
        style: const TextStyle(color: Color(0xFFA09973), fontWeight: FontWeight.bold),
      ),
      onTap: action,
    );
  }

  void _navigateToSignup(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPage(
          onRegistrationComplete: () {
          },
        ),
      ),
    );
  }
}
