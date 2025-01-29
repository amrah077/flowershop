// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFACB7),
      padding: EdgeInsets.all(20), // Added more padding
      child: MediaQuery.of(context).orientation == Orientation.landscape
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and Description Section (Added spacing and padding)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/mainimages/logoimg.png',
                      height: 50,
                    ),
                    SizedBox(width: 20), // More space between logo and text
                    Expanded(
                      child: Text(
                        'Bringing elegance and beauty to every occasion with luxurious flowers.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Quick Links and Contact Sections in a Row (Flex layout)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure space between the two columns
                  children: [
                    // Quick Links Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quick Links',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Column(
                            children: [
                              _buildLink('Home'),
                              _buildLink('About Us'),
                              _buildLink('Products'),
                              _buildLink('Contact'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 40), // Space between the columns

                    // Contact Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          _buildContactInfo('Email: info@tianhua.com'),
                          _buildContactInfo('Phone: +1 234 567 890'),
                          SizedBox(height: 16),
                          Text(
                            'Our Address',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '123 Blossom Avenue, Suite 101, Flower City, FL 56789',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          InkWell(
                            onTap: () {
                              // Navigate to the map or handle link action
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Color(0xFFA09973),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'View on Map',
                                  style: TextStyle(
                                    color: Color(0xFFA09973),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Copyright Section (Centered)
                Center(
                  child: Text(
                    '© 2024 Tian Hua. All rights reserved.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo and Description Section (Same as before for Portrait)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/mainimages/logoimg.png',
                      height: 50,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Bringing elegance and beauty to every occasion with luxurious flowers.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Quick Links Section (Vertical layout in Portrait)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Quick Links',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: [
                        _buildLink('Home'),
                        _buildLink('About Us'),
                        _buildLink('Products'),
                        _buildLink('Contact'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Contact Section (Same as before for Portrait)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildContactInfo('Email: info@tianhua.com'),
                    _buildContactInfo('Phone: +1 234 567 890'),
                    SizedBox(height: 16),
                    Text(
                      'Our Address',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '123 Blossom Avenue, Suite 101, Flower City, FL 56789',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        // Navigate to the map or handle link action
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFFA09973),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'View on Map',
                            style: TextStyle(
                              color: Color(0xFFA09973),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Copyright Section (Centered)
                Center(
                  child: Text(
                    '© 2024 Tian Hua. All rights reserved.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildContactInfo(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
