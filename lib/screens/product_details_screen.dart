import 'package:flutter/material.dart';
import 'price_comparison_screen.dart'; // Make sure this import points to your screen

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isFavorite = false; // Track favorite state

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: const Color.fromARGB(255, 252, 252, 252),
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isFavorite
                        ? '${product['name']} added to favorites'
                        : '${product['name']} removed from favorites',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product['name']} added to cart!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product['image'],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.broken_image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Product Name
            Text(
              product['name'],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Product Price
            Text(
              "\$${product['price']}",
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 20),

            // Product Tags
            if (product['tags'] != null && product['tags'].isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List<Widget>.from(
                  product['tags'].map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor: Colors.purple[100],
                    ),
                  ),
                ),
              ),
            if (product['tags'] != null && product['tags'].isNotEmpty)
              const SizedBox(height: 20),

            // Description
            const Text(
              "Description",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product['description'] ??
                  "This product is shown for demonstration purposes. "
                      "Price comparison APIs will be integrated in future versions.",
            ),
            const SizedBox(height: 30),

            // Compare Prices Button
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to PriceComparisonScreen and pass the product
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PriceComparisonScreen(productName: product['name']),
                  ),
                );
              },
              icon: const Icon(Icons.compare_arrows),
              label: const Text("Compare Prices"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 171, 90, 185),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 12),

            // Dummy Buy Now Button
            ElevatedButton.icon(
              onPressed: () {
                // Dummy action for now
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Buy Now clicked for ${product['name']}'),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Buy Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 209, 226, 109),
                minimumSize: const Size(double.infinity, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
