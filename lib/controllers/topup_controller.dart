// The topup controller holds the business logic for sending topup requests

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelflife/models/sample_products.dart';
import 'package:shelflife/utils/enums.dart';
import '../models/topup.dart';
import '../models/product.dart';

class TopupController extends StateNotifier<Topup> {
  TopupController()
      : super(Topup(
          subscriptions: sampleProducts,
          cart: [],
          products: {},
        ));

  void addProduct(Product product) {
    // get current state
    Map<String, Map<dynamic, dynamic>> copyProducts = state.products!;
    List<Product> copyCart = state.cart!;

    copyProducts[product.id] = {}; // don't know what to include here for now
    bool alreadyInCart = state.cart!.any((prod) => prod.id == product.id);

    if (alreadyInCart) {
      product.checkProduct();
      _removeProduct(product);
    } else {
      product.checkProduct();
      copyCart.add(product);
    }

    state = Topup(
      subscriptions: sampleProducts,
      products: copyProducts,
      cart: copyCart,
    );
  }

  void _removeProduct(Product product) {
    String id = product.id;

    // get current state
    Map<String, Map<dynamic, dynamic>> copyProducts = state.products!;
    List<Product> copyCart = state.cart!;

    copyProducts.remove(id);
    copyCart.removeWhere((prod) => prod.id == product.id);

    state = Topup(
      products: copyProducts,
      cart: copyCart,
    );
  }

  // sorting

  void sortProducts(SortOrder sortOrder) {
    // get current state
    Map<String, Map<dynamic, dynamic>> copyProducts = state.products!;
    List<Product> copyCart = state.cart!;
    List<Product> copySubs = state.subscriptions!;

    if (sortOrder == SortOrder.asc) {
      copySubs.sort(((a, b) => a.fullName.compareTo(b.fullName)));
    } else {
      // descending order
      copySubs.sort(((a, b) => a.fullName.compareTo(b.fullName)));
      copySubs = copySubs.reversed.toList();
    }
    state = Topup(
      subscriptions: copySubs,
      products: copyProducts,
      cart: copyCart,
    );
  }

  double subTotalToPay() {
    // calculates the total value of products to be added to invoice
    final allPrices = state.cart!.map(
      (prod) => (prod.unitPrice * prod.quantityOnShelf!),
    );
    double total = state.cart!.isEmpty
        ? 0
        : allPrices.reduce((value, element) => (value + element));
    return total;
  }
}

// initialize topup Provider
final StateNotifierProvider<TopupController, Topup> topupProvider =
    StateNotifierProvider(((ref) {
  return TopupController();
}));
