class Product {
  final String title;
  final String image;
  final double price;
  final String platform;
  final String url;

  Product({
    required this.title,
    required this.image,
    required this.price,
    required this.platform,
    required this.url,
  });

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
      title: data['title'] ?? '',
      image: data['image'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      platform: data['platform'] ?? '',
      url: data['url'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'platform': platform,
      'url': url,
    };
  }
}
