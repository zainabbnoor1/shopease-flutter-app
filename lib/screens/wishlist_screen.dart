import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/wishlist.dart';
import 'product_details_screen.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistProvider>(context).wishlist;

    return Container(
      color: Colors.purple.shade50,
      child: wishlist.isEmpty
          ? const Center(child: Text("No favorites yet."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final product = wishlist[index];
                return ListTile(
                  leading: Image.asset(
                    product["image"],
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product["name"]),
                  subtitle: Text("\$${product["price"]}"),
                  trailing: const Icon(Icons.favorite, color: Colors.red),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailsScreen(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
