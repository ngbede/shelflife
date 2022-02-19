class Product {
  final String name;
  final double price;

  Product({
    required this.name,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
      };

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"],
      price: json["price"],
    );
  }
}
