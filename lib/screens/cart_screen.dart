import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy cart items
    final cartItems = [
      {"name": "iPhone 13", "price": 999},
      {"name": "MacBook Air", "price": 1249},
    ];

    double total = cartItems.fold(
      0.0,
      (sum, item) => sum + (item["price"] as num).toDouble(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purple.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item["name"] as String),
                    trailing: Text("\$${item["price"]}"),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total:", style: TextStyle(fontSize: 18)),
                Text(
                  "\$$total",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Checkout not implemented yet."),
                  ),
                );
              },
              child: const Text("Proceed to Checkout"),
            ),
          ],
        ),
      ),
    );
  }
}
