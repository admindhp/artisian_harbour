class Product {
  final String name;
  final String imageUrl;
  final double rate;
  final String description;
  final double availableCount;

  Product(
      {
        required this.name,
        required this.imageUrl,
        required this.rate,
        required this.description,
        required this.availableCount
      }
      );

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      imageUrl: json['imageUrl'],
      rate: json['rate'],
      description: json['description'],
      availableCount: json['availableCount']

    );
  }
}
