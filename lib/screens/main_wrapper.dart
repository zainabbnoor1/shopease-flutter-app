import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import 'notification_screen.dart';
import 'wishlist_screen.dart'; // ✅ Import wishlist

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 2; // Default to Home

  final List<Widget> _screens = const [
    CartScreen(), // index 0
    WishlistScreen(), // index 1
    HomeScreen(), // index 2
    NotificationScreen(), // index 3
    ProfileScreen(), // index 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 2
          ? AppBar(
              automaticallyImplyLeading: false, // ✅ Hides back arrow
              backgroundColor: Colors.purple,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "ShopEase",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: const IconThemeData(color: Colors.black),
            )
          : null, // ❌ No AppBar for other screens
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
