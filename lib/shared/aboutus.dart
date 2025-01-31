//ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_import

import 'package:flowershop/shared/bottombar.dart';
import 'package:flowershop/shared/cart.dart';
import 'package:flowershop/shared/wishlist.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';  

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80.0, left: 16, right: 16),
                child: Center( // Center the heading
                  child: Text(
                    'About Tian Hua',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                          ? 32
                          : 40, // Adjusting font size depending on orientation
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Color(0xFFA09973), 
                    ),
                  ),
                ),
              ),

              MediaQuery.of(context).orientation == Orientation.portrait
                  ? _buildSection(
                      'At Tian Hua, we believe flowers are more than just plants; they are a way to communicate emotions, express love, and bring beauty to every moment. As a luxury floral business, we are dedicated to offering only the finest, handpicked flowers that meet our rigorous standards for freshness and elegance. Our wide range of carefully curated floral arrangements is designed to suit every occasion, from weddings and anniversaries to corporate events and intimate gatherings.',
                      'assets/aboutus/flex1.jpg',
                      context,
                    )
                  : _buildLandscapeSection(
                      'At Tian Hua, we believe flowers are more than just plants; they are a way to communicate emotions, express love, and bring beauty to every moment. As a luxury floral business, we are dedicated to offering only the finest, handpicked flowers that meet our rigorous standards for freshness and elegance. Our wide range of carefully curated floral arrangements is designed to suit every occasion, from weddings and anniversaries to corporate events and intimate gatherings.',
                      'assets/aboutus/flex1.jpg',
                    ),
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? _buildSection(
                      'With a commitment to excellence, Tian Hua brings the artistry of floristry into every bouquet we craft. Each arrangement is thoughtfully designed to reflect the beauty and essence of nature, while our delivery service ensures that your floral gifts arrive in perfect condition, right on time. Whether you\'re celebrating a special moment or simply want to brighten someone\'s day, we’re here to help you convey your heartfelt emotions through the timeless language of flowers.',
                      'assets/aboutus/flex2.jpg',
                      context,
                    )
                  : _buildLandscapeSection(
                      'With a commitment to excellence, Tian Hua brings the artistry of floristry into every bouquet we craft. Each arrangement is thoughtfully designed to reflect the beauty and essence of nature, while our delivery service ensures that your floral gifts arrive in perfect condition, right on time. Whether you\'re celebrating a special moment or simply want to brighten someone\'s day, we’re here to help you convey your heartfelt emotions through the timeless language of flowers.',
                      'assets/aboutus/flex2.jpg',
                    ),
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? _buildSection(
                      'At Tian Hua, we also prioritize sustainability in every step of our floral process. From sourcing eco-friendly materials for our arrangements to partnering with local growers who adhere to sustainable practices, we are committed to minimizing our environmental footprint. We believe that luxury should not come at the expense of the planet, and every bouquet we deliver is a reflection of our dedication to both beauty and responsibility. Your floral gifts not only bring joy to the recipient but also contribute to a greener, more sustainable world.',
                      'assets/aboutus/flex3.jpg',
                      context,
                    )
                  : _buildLandscapeSection(
                      'At Tian Hua, we also prioritize sustainability in every step of our floral process. From sourcing eco-friendly materials for our arrangements to partnering with local growers who adhere to sustainable practices, we are committed to minimizing our environmental footprint. We believe that luxury should not come at the expense of the planet, and every bouquet we deliver is a reflection of our dedication to both beauty and responsibility. Your floral gifts not only bring joy to the recipient but also contribute to a greener, more sustainable world.',
                      'assets/aboutus/flex3.jpg',
                    ),
              _buildLogosSection(context),
            ],
          ),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Navbar(),
      ),
    );
  }

  Widget _buildSection(String text, String imagePath, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFA09973), 
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              return MediaQuery.of(context).orientation == Orientation.landscape
                  ? Container() 
                  : Image.asset(
                      imagePath,
                      height: constraints.maxWidth > 600 ? 300 : 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeSection(String text, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32), 
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFA09973),
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // The logod section uses a Flex layout for landscape mode.
  Widget _buildLogosSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: MediaQuery.of(context).orientation == Orientation.portrait
          ? Center( // Centered the logos section in portrait mode
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLogo('assets/aboutus/infoimg1.png', 'FARM-FRESH QUALITY',
                      'Sourced from our own\nfarms, our flowers stay fresh\nfor longer.'),
                  _buildLogo('assets/aboutus/infoimg1.png', 'HANDCRAFTED BOUQUETS',
                      'Handcrafted exquisite\nflower bouquets designed to meet\nglobal standards.'),
                  _buildLogo('assets/aboutus/infoimg1.png', 'QUICK DELIVERY SERVICE',
                      'Enjoy same-day\ndelivery.'),
                ],
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row( //horizontal flex layout
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLogo('assets/aboutus/infoimg1.png', 'FARM-FRESH QUALITY',
                      'Sourced from our own\nfarms, our flowers stay fresh\nfor longer.'),
                  _buildLogo('assets/aboutus/infoimg1.png', 'HANDCRAFTED BOUQUETS',
                      'Handcrafted exquisite\nflower bouquets designed to meet\nglobal standards.'),
                  _buildLogo('assets/aboutus/infoimg1.png', 'QUICK DELIVERY SERVICE',
                      'Enjoy same-day\ndelivery.'),
                ],
              ),
            ),
    );
  }

  Widget _buildLogo(String imagePath, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 100,
            width: 100,
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFA09973), 
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFFA09973), 
              fontFamily: 'Roboto',
            ),
          ),
        ],
      ),
    );
  }
}
