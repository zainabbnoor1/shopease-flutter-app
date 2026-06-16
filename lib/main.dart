import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/utils/wishlist.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/wishlist_screen.dart';
import 'screens/main_wrapper.dart';
import 'screens/price_comparison_screen.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // 👇 Connect to local emulators if in debug mode
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
      print('✅ Connected to Firebase emulators');
    } catch (e) {
      print('⚠️ Emulator connection failed: $e');
    }
  }
  runApp(
    ChangeNotifierProvider(
      create: (_) => WishlistProvider(),
      child: const ShopEaseApp(),
    ),
  );
}

class ShopEaseApp extends StatelessWidget {
  const ShopEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'ShopEase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => const MainWrapper(),
        '/cart': (context) => const CartScreen(),
        '/details': (context) => const ProductDetailsScreen(product: {}),
        '/wishlist': (context) => const WishlistScreen(),
        '/compare': (context) => const PriceComparisonScreen(productName: ''),
      },
    );
  }
}
