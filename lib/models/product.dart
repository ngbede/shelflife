class Product {
  final String id;
  final String fullName;
  final double unitPrice;
  final String basicUnit;
  final int presentation;
  final String category;
  final bool? eligibleForPAYS;
  final bool? eligibleForPOD;

  Product({
    required this.id,
    required this.fullName,
    required this.unitPrice,
    required this.basicUnit,
    required this.presentation,
    required this.category,
    this.eligibleForPAYS,
    this.eligibleForPOD,
  });

  Map<String, dynamic> toJson() => {
        "name": fullName,
        "price": unitPrice,
      };

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      fullName: json["fullName"],
      unitPrice: json["unitPrice"],
      basicUnit: json["basicUnit"],
      presentation: json["presentation"],
      category: json["category"],
      eligibleForPAYS: json["eligibleForPAYS"],
      eligibleForPOD: json["eligibleForPOD"],
    );
  }
}
