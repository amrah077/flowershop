// ignore_for_file: use_super_parameters, prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:flowershop/shared/bottombar.dart';
import 'package:flutter/material.dart';
import 'navbar.dart'; 
import 'productcard.dart'; 
import 'footer.dart'; 

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({Key? key}) : super(key: key);

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  final List<Map<String, dynamic>> products = [
     {"id": "A1", "name": "Eternal Grace", "price": "9500","largeprice":"13300", "image": "assets/products/wb1.webp", "category": "wedding", "color": ["pink", "white"], "flower": "rose", "description": "A beautiful wedding bouquet featuring elegant roses in soft pink and white, symbolizing love and grace."},
      {"id": "A2", "name": "Blissful Bloom", "price": "12000","largeprice":"17000",  "image": "assets/products/wb2.webp", "category": "wedding", "color": "white", "flower": ["peony", "rose"], "description": "A perfect blend of peonies and roses in white, capturing the essence of joy and bliss."},
      {"id": "A3", "name": "Golden Vows", "price": "11500","largeprice":"16400", "image": "assets/products/wb3.webp", "category": "wedding", "color": ["pink", "red"], "flower": ["rose", "marigold"], "description": "This wedding bouquet combines pink roses and vibrant marigolds, celebrating a golden union."},
      {"id": "A4", "name": "Forever Yours", "price": "10000","largeprice":"14700", "image": "assets/products/wb4.webp", "category": "wedding", "color": "white", "flower": "rose", "description": "A timeless white rose bouquet that signifies everlasting love and commitment."},
      {"id": "A5", "name": "Pure Serenity", "price": "8500","largeprice":"12300", "image": "assets/products/wb5.webp", "category": "wedding", "color": ["red", "white", "pink"], "flower": ["marigold", "peony"], "description": "An exquisite mix of marigolds and peonies, in vibrant red and soft pink, creating a serene and elegant feel."},
      {"id": "A6", "name": "Lavender Dreams", "price": "9000","largeprice":"13300", "image": "assets/products/wb6.webp", "category": "wedding", "color": ["yellow", "white"], "flower": ["peony", "rose"], "description": "A dreamy combination of yellow and white flowers, featuring peonies and roses, perfect for a spring wedding."},
      {"id": "A7", "name": "Radiant Romance", "price": "13500","largeprice":"18900", "image": "assets/products/wb7.webp", "category": "wedding", "color": "red", "flower": "rose", "description": "A bold and passionate bouquet of red roses, symbolizing the intensity of love and romance."},
      {"id": "A8", "name": "Heavenly Elegance", "price": "7000","largeprice":"10000", "image": "assets/products/wb8.webp", "category": "wedding", "color": "white", "flower": "lily", "description": "A serene and graceful lily bouquet in white, perfect for a heavenly touch to your wedding."},
      {"id": "A9", "name": "Garden Symphony", "price": "6500","largeprice":"10600", "image": "assets/products/mb1.webp", "category": "mixed", "color": ["pink", "red"], "flower": ["lily", "peony", "rose"], "description": "A harmonious garden bouquet featuring lilies, peonies, and roses in soft pink and bold red hues."},
      {"id": "A10", "name": "Pastel Whispers", "price": "5800", "largeprice":"14700", "image": "assets/products/mb2.webp", "category": "mixed", "color": "white", "flower": "peony", "description": "A soft and delicate peony bouquet in pastel white, bringing elegance and subtle charm to any occasion."},
      {"id": "A11", "name": "Blooming Harmony", "price": "7200","largeprice":"9800", "image": "assets/products/mb3.webp", "category": "mixed", "color": "pink", "flower": ["marigold", "rose"], "description": "A perfect blend of pink marigolds and roses, symbolizing the harmony of love and friendship."},
      {"id": "A12", "name": "Sunlit Charm", "price": "6000","largeprice":"8500", "image": "assets/products/mb4.webp", "category": "mixed", "color": ["pink", "white", "red"], "flower": ["lily", "rose"], "description": "A radiant mix of lilies and roses in pink, white, and red, evoking the warmth and charm of a sunlit day."},
      {"id": "A13", "name": "Radiant Bliss", "price": "7800","largeprice":"15000", "image": "assets/products/mb5.webp", "category": "mixed", "color": "white", "flower": "lily", "description": "A pure and stunning bouquet of white lilies, bringing peace and radiant joy to any setting."},
      {"id": "A14", "name": "Autumn Rhapsody", "price": "6700","largeprice":"8700", "image": "assets/products/mb6.webp", "category": "mixed", "color": ["pink", "red", "white", "yellow"], "flower": "tulip", "description": "A colorful blend of tulips in autumn shades, symbolizing the harmony of nature and love."},
      {"id": "A15", "name": "Floral Serenade", "price": "7500","largeprice":"11100", "image": "assets/products/mb7.webp", "category": "mixed", "color": ["yellow", "white"], "flower": ["sunflower", "rose"], "description": "A bright and cheerful bouquet of sunflowers and roses, creating a serenade of happiness and warmth."},
      {"id": "A16", "name": "Rainbow Delight", "price": "8200","largeprice":"15500", "image": "assets/products/mb8.webp", "category": "mixed", "color": "yellow", "flower": "marigold", "description": "A delightful bouquet of yellow marigolds, bringing a burst of color and joy to any occasion."},
      {"id": "A17", "name": "Charming Medley", "price": "6900","largeprice":"9300", "image": "assets/products/mb9.webp", "category": "mixed", "color": ["red", "pink"], "flower": "rose", "description": "A charming medley of red and pink roses, capturing the essence of romance and beauty."},
      {"id": "A18", "name": "Dahlia Pink", "price": "4500","largeprice":"8000", "image": "assets/products/dahliapink.webp", "category": "single", "color": "pink", "flower": "dahlia", "description": "A stunning pink dahlia, radiating elegance and beauty in a single bloom."},
      {"id": "A19", "name": "Lily Pink", "price": "5000","largeprice":"10000", "image": "assets/products/lilypink.webp", "category": "single", "color": "pink", "flower": "lily", "description": "A graceful pink lily, symbolizing purity and beauty, perfect for any special occasion."},
      {"id": "A20", "name": "Marigold Pink", "price": "3800","largeprice":"6000", "image": "assets/products/marigoldpink.webp", "category": "single", "color": "pink", "flower": "marigold", "description": "A cheerful pink marigold, radiating warmth and joy in any setting."},
      {"id": "A21", "name": "Orchid Pink", "price": "6200","largeprice":"9900", "image": "assets/products/orchidpink.webp", "category": "single", "color": "pink", "flower": "orchid", "description": "An exquisite pink orchid, symbolizing luxury and refinement, perfect for a special occasion."},
      {"id": "A22", "name": "Peony Pink", "price": "4800","largeprice":"7500", "image": "assets/products/peonypink.webp", "category": "single", "color": "pink", "flower": "peony", "description": "A delicate pink peony, evoking feelings of love and happiness in a single, stunning bloom."},
      {"id": "A23", "name": "Rose Pink", "price": "5500","largeprice":"11200", "image": "assets/products/rosepink.webp", "category": "single", "color": "pink", "flower": "rose", "description": "A classic pink rose, the epitome of love, beauty, and elegance."},
      {"id": "A24", "name": "Sunflower", "price": "8000","largeprice":"15000", "image": "assets/products/sunflower.webp", "category": "single", "color": "yellow", "flower": "sunflower", "description": "A bright and cheerful sunflower, spreading happiness and positivity with its golden petals."},
      {"id": "A25", "name": "Tulip Pink", "price": "12300","largeprice":"18600", "image": "assets/products/tulippink.webp", "category": "single", "color": "pink", "flower": "tulip", "description": "A soft and elegant pink tulip, symbolizing perfect love and beauty in simplicity."}
  ];

    List<Map<String, dynamic>> filteredProducts = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
  }

  void filterProducts(String query) {
    setState(() {
      filteredProducts = products.where((product) {
        final colorMatches = product['color'] is List
            ? (product['color'] as List).any((color) => color.toLowerCase().contains(query.toLowerCase()))
            : product['color'].toLowerCase().contains(query.toLowerCase());
        
        final flowerMatches = (product['flower'] is List
            ? (product['flower'] as List).any((flower) => flower.toLowerCase().contains(query.toLowerCase()))
            : product['flower'].toLowerCase().contains(query.toLowerCase()));

        final categoryMatches = product['category'].toLowerCase().contains(query.toLowerCase());

        return colorMatches || flowerMatches || categoryMatches;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100, 
              child: Navbar(),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 8.0, 8.0),
              child: Text(
                'All Products',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFA09973), // Custom color applied
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onSubmitted: filterProducts, // Trigger search when the text changes
                decoration: InputDecoration(
                  hintText: "Search by category, color, or flower...",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),

            SizedBox(height: 16.0),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // Prevent scrolling here
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLandscape ? 2 : 1, // Adjust the number of columns based on orientation.
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 0.7, 
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: filteredProducts[index],
                  );
                },
              ),
            ),

            // Footer
            Footer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
