import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _wishlist = [];

  List<Map<String, dynamic>> get wishlist => _wishlist;

  void toggleFavorite(Map<String, dynamic> product) {
    final exists = _wishlist.any((item) => item["name"] == product["name"]);
    if (exists) {
      _wishlist.removeWhere((item) => item["name"] == product["name"]);
    } else {
      _wishlist.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> product) {
    return _wishlist.any((item) => item["name"] == product["name"]);
  }
}
