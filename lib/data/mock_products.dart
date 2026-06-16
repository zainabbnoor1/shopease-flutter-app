List<Map<String, dynamic>> mockProducts(String query) {
  return [
    {
      "title": "$query (Amazon)",
      "price": 27999,
      "platform": "Amazon",
      "image":
          "https://source.unsplash.com/featured/?${Uri.encodeComponent(query)}",
      "url": "https://www.amazon.com",
    },
    {
      "title": "$query (AliExpress)",
      "price": 26500,
      "platform": "AliExpress",
      "image":
          "https://source.unsplash.com/featured/?${Uri.encodeComponent(query)}",
      "url": "https://www.aliexpress.com",
    },
    {
      "title": "$query (Daraz)",
      "price": 27000,
      "platform": "Daraz",
      "image":
          "https://source.unsplash.com/featured/?${Uri.encodeComponent(query)}",
      "url": "https://www.daraz.pk",
    },
  ];
}
