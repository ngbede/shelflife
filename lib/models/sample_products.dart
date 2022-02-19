import 'package:shelflife/models/product.dart';

// idea is to first get our product from SL Api
// we parse the Json response for product subsriptions into our product model
// then using the list of products we can do stuff like search for product and implement some logic
// basic version of the model for now
final List<Product> sampleProducts = [
  Product(name: "Amatem Softgel", price: 1270.00),
  Product(name: "Ventolin Inhaler", price: 2300),
  Product(name: "Amatem Softgel", price: 1270.00),
  Product(name: "Ventolin Inhaler", price: 2300),
  Product(name: "Amatem Softgel", price: 1270.00),
  Product(name: "Ventolin Inhaler", price: 2300),
  Product(name: "Amatem Softgel", price: 1270.00),
  Product(name: "Ventolin Inhaler", price: 2300),
  Product(name: "Amatem Softgel", price: 1270.00),
  Product(name: "Ventolin Inhaler", price: 2300),
  Product(name: "Amatem Softgel", price: 1270.00),
  Product(name: "Ventolin Inhaler", price: 2300),
];
