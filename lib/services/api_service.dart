import 'package:cloud_functions/cloud_functions.dart';
import '../models/product_model.dart';

class ApiService {
  static Future<List<Product>> fetchProducts(String query) async {
    final HttpsCallable callable = FirebaseFunctions.instance.httpsCallable(
      'getPrices',
    ); // your function name
    final result = await callable.call({'query': query});

    final data = result.data as List;
    return data
        .map((item) => Product.fromMap(Map<String, dynamic>.from(item)))
        .toList();
  }
}
