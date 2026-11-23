class Product {
  final int id;
  final String name;
  final String slug;
  final int price;
  final int stock;
  final bool isActive;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.price,
    required this.stock,
    required this.isActive,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      price: json['price'],
      stock: json['stock'],
      isActive: json['is_active'],
    );
  }
}
