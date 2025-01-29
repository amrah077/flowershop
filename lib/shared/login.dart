// ignore_for_file: prefer_const_constructors, use_super_parameters, library_private_types_in_public_api, use_build_context_synchronously

import 'package:flowershop/shared/homepage.dart';
import 'package:flowershop/shared/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quickalert/quickalert.dart';

class LoginPopup extends StatefulWidget {
  final VoidCallback onSignupClicked;
  final VoidCallback onClose;
  final VoidCallback onSwitchToSignup;

  const LoginPopup({
    Key? key,
    required this.onSignupClicked,
    required this.onClose,
    required this.onSwitchToSignup,
  }) : super(key: key);

  @override
  _LoginPopupState createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

void _login() async {
  if (_formKey.currentState!.validate()) {
    if (_usernameController.text == 'amrah' && _passwordController.text == 'leo123') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login successful!"),
          backgroundColor: Colors.green,
        ),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Incorrect username or password!"),
          backgroundColor: Colors.red,
        ),
      );
      _showErrorAlert();
    }
  }
}

  void _showErrorAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: "Error",
      text: "Incorrect username or password",
      confirmBtnColor: const Color(0xFFA09973),
      onConfirmBtnTap: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFA09973)),
          onPressed: widget.onClose,
        ),
      ),
      body: Center(
        child: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA09973),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(color: Color(0xFFA09973)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA09973)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color(0xFFA09973)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA09973)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFA09973),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupPage(
                          onRegistrationComplete: () {
                            Navigator.pop(context); // Close the signup page and return to login
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFA09973),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
