// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flowershop/shared/bottombar.dart';
import 'package:flutter/material.dart';
import 'navbar.dart'; // Import your navbar
import 'productsection.dart'; // Import your ProductSection widget
import 'footer.dart'; // Import your Footer widget (assuming the footer is in footer.dart)

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> heroImages = [
    "assets/mainimages/heroimg1.jpg",
    "assets/mainimages/heroimg2.jpg",
    "assets/mainimages/heroimg3.jpg",
    "assets/mainimages/heroimg4.jpg",
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startImageSlider();
  }

  void _startImageSlider() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % heroImages.length;
        });
        _startImageSlider();
      }
    });
  }

final List<Map<String, dynamic>> bestSellers = [
    {"id": "A14", "name": "Autumn Rhapsody", "price": "6700","largeprice":"8700", "image": "assets/products/mb6.webp", "category": "mixed", "color": ["pink", "red", "white", "yellow"], "flower": "tulip", "description": "A colorful blend of tulips in autumn shades, symbolizing the harmony of nature and love."},
      {"id": "A15", "name": "Floral Serenade", "price": "7500","largeprice":"11100", "image": "assets/products/mb7.webp", "category": "mixed", "color": ["yellow", "white"], "flower": ["sunflower", "rose"], "description": "A bright and cheerful bouquet of sunflowers and roses, creating a serenade of happiness and warmth."},
      {"id": "A24", "name": "Sunflower", "price": "8000","largeprice":"15000", "image": "assets/products/sunflower.webp", "category": "single", "color": "yellow", "flower": "sunflower", "description": "A bright and cheerful sunflower, spreading happiness and positivity with its golden petals."},
      {"id": "A25", "name": "Tulip Pink", "price": "12300","largeprice":"18600", "image": "assets/products/tulippink.webp", "category": "single", "color": "pink", "flower": "tulip", "description": "A soft and elegant pink tulip, symbolizing perfect love and beauty in simplicity."},
      {"id": "A7", "name": "Radiant Romance", "price": "13500","largeprice":"18900", "image": "assets/products/wb7.webp", "category": "wedding", "color": "red", "flower": "rose", "description": "A bold and passionate bouquet of red roses, symbolizing the intensity of love and romance."},
      {"id": "A8", "name": "Heavenly Elegance", "price": "7000","largeprice":"10000", "image": "assets/products/wb8.webp", "category": "wedding", "color": "white", "flower": "lily", "description": "A serene and graceful lily bouquet in white, perfect for a heavenly touch to your wedding."},
     ];

final List<Map<String, dynamic>> mixedBouquets = [
    {"id": "A9", "name": "Garden Symphony", "price": "6500","largeprice":"10600", "image": "assets/products/mb1.webp", "category": "mixed", "color": ["pink", "red"], "flower": ["lily", "peony", "rose"], "description": "A harmonious garden bouquet featuring lilies, peonies, and roses in soft pink and bold red hues."},
      {"id": "A10", "name": "Pastel Whispers", "price": "5800", "largeprice":"14700", "image": "assets/products/mb2.webp", "category": "mixed", "color": "white", "flower": "peony", "description": "A soft and delicate peony bouquet in pastel white, bringing elegance and subtle charm to any occasion."},
      {"id": "A11", "name": "Blooming Harmony", "price": "7200","largeprice":"9800", "image": "assets/products/mb3.webp", "category": "mixed", "color": "pink", "flower": ["marigold", "rose"], "description": "A perfect blend of pink marigolds and roses, symbolizing the harmony of love and friendship."},
      {"id": "A12", "name": "Sunlit Charm", "price": "6000","largeprice":"8500", "image": "assets/products/mb4.webp", "category": "mixed", "color": ["pink", "white", "red"], "flower": ["lily", "rose"], "description": "A radiant mix of lilies and roses in pink, white, and red, evoking the warmth and charm of a sunlit day."},
      {"id": "A13", "name": "Radiant Bliss", "price": "7800","largeprice":"15000", "image": "assets/products/mb5.webp", "category": "mixed", "color": "white", "flower": "lily", "description": "A pure and stunning bouquet of white lilies, bringing peace and radiant joy to any setting."},
      {"id": "A14", "name": "Autumn Rhapsody", "price": "6700","largeprice":"8700", "image": "assets/products/mb6.webp", "category": "mixed", "color": ["pink", "red", "white", "yellow"], "flower": "tulip", "description": "A colorful blend of tulips in autumn shades, symbolizing the harmony of nature and love."},
      {"id": "A15", "name": "Floral Serenade", "price": "7500","largeprice":"11100", "image": "assets/products/mb7.webp", "category": "mixed", "color": ["yellow", "white"], "flower": ["sunflower", "rose"], "description": "A bright and cheerful bouquet of sunflowers and roses, creating a serenade of happiness and warmth."},
      {"id": "A16", "name": "Rainbow Delight", "price": "8200","largeprice":"15500", "image": "assets/products/mb8.webp", "category": "mixed", "color": "yellow", "flower": "marigold", "description": "A delightful bouquet of yellow marigolds, bringing a burst of color and joy to any occasion."},
      {"id": "A17", "name": "Charming Medley", "price": "6900","largeprice":"9300", "image": "assets/products/mb9.webp", "category": "mixed", "color": ["red", "pink"], "flower": "rose", "description": "A charming medley of red and pink roses, capturing the essence of romance and beauty."}
];


final List<Map<String, dynamic>> singleFlowerBouquets = [
   {"id": "A18", "name": "Dahlia Pink", "price": "4500","largeprice":"8000", "image": "assets/products/dahliapink.webp", "category": "single", "color": "pink", "flower": "dahlia", "description": "A stunning pink dahlia, radiating elegance and beauty in a single bloom."},
      {"id": "A19", "name": "Lily Pink", "price": "5000","largeprice":"10000", "image": "assets/products/lilypink.webp", "category": "single", "color": "pink", "flower": "lily", "description": "A graceful pink lily, symbolizing purity and beauty, perfect for any special occasion."},
      {"id": "A20", "name": "Marigold Pink", "price": "3800","largeprice":"6000", "image": "assets/products/marigoldpink.webp", "category": "single", "color": "pink", "flower": "marigold", "description": "A cheerful pink marigold, radiating warmth and joy in any setting."},
      {"id": "A21", "name": "Orchid Pink", "price": "6200","largeprice":"9900", "image": "assets/products/orchidpink.webp", "category": "single", "color": "pink", "flower": "orchid", "description": "An exquisite pink orchid, symbolizing luxury and refinement, perfect for a special occasion."},
      {"id": "A22", "name": "Peony Pink", "price": "4800","largeprice":"7500", "image": "assets/products/peonypink.webp", "category": "single", "color": "pink", "flower": "peony", "description": "A delicate pink peony, evoking feelings of love and happiness in a single, stunning bloom."},
      {"id": "A23", "name": "Rose Pink", "price": "5500","largeprice":"11200", "image": "assets/products/rosepink.webp", "category": "single", "color": "pink", "flower": "rose", "description": "A classic pink rose, the epitome of love, beauty, and elegance."},
      {"id": "A24", "name": "Sunflower", "price": "8000","largeprice":"15000", "image": "assets/products/sunflower.webp", "category": "single", "color": "yellow", "flower": "sunflower", "description": "A bright and cheerful sunflower, spreading happiness and positivity with its golden petals."},
      {"id": "A25", "name": "Tulip Pink", "price": "12300","largeprice":"18600", "image": "assets/products/tulippink.webp", "category": "single", "color": "pink", "flower": "tulip", "description": "A soft and elegant pink tulip, symbolizing perfect love and beauty in simplicity."},
    
];


  final List<Map<String, dynamic>> weddingArrangements = [
    {"id": "A1", "name": "Eternal Grace", "price": "9500","largeprice":"13300", "image": "assets/products/wb1.webp", "category": "wedding", "color": ["pink", "white"], "flower": "rose", "description": "A beautiful wedding bouquet featuring elegant roses in soft pink and white, symbolizing love and grace."},
      {"id": "A2", "name": "Blissful Bloom", "price": "12000","largeprice":"17000",  "image": "assets/products/wb2.webp", "category": "wedding", "color": "white", "flower": ["peony", "rose"], "description": "A perfect blend of peonies and roses in white, capturing the essence of joy and bliss."},
      {"id": "A3", "name": "Golden Vows", "price": "11500","largeprice":"16400", "image": "assets/products/wb3.webp", "category": "wedding", "color": ["pink", "red"], "flower": ["rose", "marigold"], "description": "This wedding bouquet combines pink roses and vibrant marigolds, celebrating a golden union."},
      {"id": "A4", "name": "Forever Yours", "price": "10000","largeprice":"14700", "image": "assets/products/wb4.webp", "category": "wedding", "color": "white", "flower": "rose", "description": "A timeless white rose bouquet that signifies everlasting love and commitment."},
      {"id": "A5", "name": "Pure Serenity", "price": "8500", "image": "assets/products/wb5.webp", "category": "wedding", "color": ["red", "white", "pink"], "flower": ["marigold", "peony"], "description": "An exquisite mix of marigolds and peonies, in vibrant red and soft pink, creating a serene and elegant feel."},
      {"id": "A6", "name": "Lavender Dreams", "price": "9000","largeprice":"13300", "image": "assets/products/wb6.webp", "category": "wedding", "color": ["yellow", "white"], "flower": ["peony", "rose"], "description": "A dreamy combination of yellow and white flowers, featuring peonies and roses, perfect for a spring wedding."},
      {"id": "A7", "name": "Radiant Romance", "price": "13500","largeprice":"18900", "image": "assets/products/wb7.webp", "category": "wedding", "color": "red", "flower": "rose", "description": "A bold and passionate bouquet of red roses, symbolizing the intensity of love and romance."},
      {"id": "A8", "name": "Heavenly Elegance", "price": "7000","largeprice":"10000", "image": "assets/products/wb8.webp", "category": "wedding", "color": "white", "flower": "lily", "description": "A serene and graceful lily bouquet in white, perfect for a heavenly touch to your wedding."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      body: Stack(
        children: [
          Navbar(), // Navbar at the top layer
          Positioned.fill(
            top: 50,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Slider Section
                  Container(
                    width: double.infinity, // Make the hero image take full width
                    height: 250, // Set the height for the hero image
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1), // Smooth transition
                      child: Image.asset(
                        heroImages[_currentIndex],
                        key: ValueKey<int>(_currentIndex), // Unique key for each image
                        fit: BoxFit.cover, // Ensures image covers the area fully
                        width: double.infinity, // Make sure it covers the full width
                      ),
                    ),
                  ),

                  // Best Sellers Section
                  ProductSection(
                    sectionTitle: 'Best-Sellers',
                    products: bestSellers,
                  ),

                  // Mixed Bouquets Section
                  ProductSection(
                    sectionTitle: 'Mixed Bouquets',
                    products: mixedBouquets,
                  ),

                  // Single Flower Bouquets Section
                  ProductSection(
                    sectionTitle: 'Single Flower Bouquets',
                    products: singleFlowerBouquets,
                  ),

                  // Wedding Arrangements Section
                  ProductSection(
                    sectionTitle: 'Wedding Arrangements',
                    products: weddingArrangements,
                  ),

                  // Add space below Wedding Arrangements Section
                  const SizedBox(height: 20), // Add some space below this section

                  // Footer Section
                  Footer(), // Your Footer widget (ensure it's defined in footer.dart)
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
