import 'package:flutter/material.dart';
import 'product_details_screen.dart';
import 'products_screen.dart'; // ✅ new screen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch() {
    final query = _searchController.text.trim();
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProductsScreen(query: query)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade50,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildPromoCarousel(),
            const SizedBox(height: 16),
            _buildCategories(),
            const SizedBox(height: 16),
            _buildHotSales(context),
            const SizedBox(height: 16),
            _buildFlashSale(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'What are you looking for?',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (_) => _onSearch(),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.purple),
          onPressed: _onSearch,
        ),
      ],
    );
  }

  Widget _buildPromoCarousel() {
    return Container(
      height: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: PageView(
        children: [
          Image.asset('assets/images/promo4.jpg', fit: BoxFit.cover),
          Image.asset('assets/images/promo2.jpg', fit: BoxFit.cover),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      'Electronics',
      'Fashion',
      'Phones',
      'Laptops',
      'Sports',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            TextButton(onPressed: () {}, child: const Text('See All')),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: categories.map((cat) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to ProductsScreen with the selected category
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductsScreen(query: cat),
                      ),
                    );
                  },
                  child: Chip(
                    label: Text(cat),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildHotSales(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hot Sales',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProductCard(
                context,
                "Sony WH1000XM4",
                "4999",
                "assets/images/headphones.jpg",
              ),
              _buildProductCard(
                context,
                "Puma Shoes",
                "40000",
                "assets/images/shoes.jpeg",
              ),
              _buildProductCard(
                context,
                "Smart Watch",
                "1499",
                "assets/images/watch.jpg",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFlashSale(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Flash Sale',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 10),
        Row(
          children: const [
            Icon(Icons.timer, color: Colors.red),
            SizedBox(width: 5),
            Text('09:59:59', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildProductCard(
                context,
                "PS5 Controller",
                "8000",
                "assets/images/controller.jpeg",
                discount: "-30%",
              ),
              _buildProductCard(
                context,
                "iPhone 14",
                "28000",
                "assets/images/iphone.png",
                discount: "-40%",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(
    BuildContext context,
    String name,
    String price,
    String imagePath, {
    String? discount,
  }) {
    final product = {
      "name": name,
      "price": price,
      "image": imagePath,
      "discount": discount,
    };

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(imagePath, height: 80, fit: BoxFit.cover),
                ),
                if (discount != null)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      child: Text(
                        discount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(
              "\$$price",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
