// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flowershop/shared/bottombar.dart';
import 'package:flutter/material.dart';
import 'navbar.dart'; // Import your Navbar widget
import 'footer.dart'; // Import your Footer widget

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Navbar(), // Use Navbar as the appBar here
      ),
      backgroundColor: Colors.white, // Ensure the background is white
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Contact Us Heading
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 16, right: 16), // Reduced top padding
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA09973),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            // Contact Us Paragraph Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
                  Text(
                    'We\'d love to hear from you! Whether you have questions, need assistance, or want to provide feedback, we\'re here to help.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFA09973),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // Contact Form Section
            LayoutBuilder(
              builder: (context, constraints) {
                // Check if the device is in landscape mode
                if (constraints.maxWidth > constraints.maxHeight) {
                  // Landscape mode layout
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Column with Name and Email Fields
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Your Name:',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFA09973),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFA09973),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFA09973),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Your Email:',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFA09973),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFA09973),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFA09973),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16), // Space between the columns
                        // Right Column with Message Field
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: TextFormField(
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    labelText: 'Your Message:',
                                    labelStyle: TextStyle(
                                      color: Color(0xFFA09973),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFA09973),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFA09973),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Handle the form submission
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFA09973), // Accent color
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    'Send Message',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white, // Text color for the button
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Portrait mode layout (default design, no changes here)
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Name Field
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Your Name:',
                              labelStyle: TextStyle(
                                color: Color(0xFFA09973),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA09973),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA09973),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        // Email Field
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Your Email:',
                              labelStyle: TextStyle(
                                color: Color(0xFFA09973),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA09973),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA09973),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        // Message Field
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: TextFormField(
                            maxLines: 6,
                            decoration: InputDecoration(
                              labelText: 'Your Message:',
                              labelStyle: TextStyle(
                                color: Color(0xFFA09973),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA09973),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFA09973),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        // Submit Button - Aligned to the right
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle the form submission
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFA09973), // Accent color
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Send Message',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white, // Text color for the button
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            // Add some margin between content and footer
            SizedBox(height: 40),
            Footer(), // Assuming you have a Footer widget
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
