import 'package:flutter/material.dart';

class PriceComparisonScreen extends StatelessWidget {
  final String productName;

  const PriceComparisonScreen({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> priceList = [
      {"platform": "Amazon", "price": 999.99, "availability": "In Stock"},
      {"platform": "eBay", "price": 950.00, "availability": "Limited Stock"},
      {"platform": "AliExpress", "price": 920.00, "availability": "In Stock"},
    ];

    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Text("Compare Prices - $productName"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Price Comparison",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Platform')),
                    DataColumn(label: Text('Price')),
                    DataColumn(label: Text('Availability')),
                  ],
                  rows: priceList.map((entry) {
                    return DataRow(
                      cells: [
                        DataCell(Text(entry['platform'])),
                        DataCell(Text("\$${entry['price']}")),
                        DataCell(Text(entry['availability'])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
