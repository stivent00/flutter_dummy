class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;
  final String sku;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
    required this.sku,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage']?.toDouble() ?? 0.0,
      rating: json['rating']?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? 'Sin marca',
      category: json['category'] ?? 'Sin categoría',
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      sku: json['sku'] ?? 'N/A', // Asigna 'N/A' si no está presente
    );
  }
}


/*
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final int stock;  
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.stock,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      thumbnail: json['thumbnail'],
    );
  }
}
*/
