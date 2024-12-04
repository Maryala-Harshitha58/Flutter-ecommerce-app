import 'package:flutter/material.dart';
import 'cart_item.dart';
import 'product.dart';

class CartProvider with ChangeNotifier {
  final Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => {..._items};

  int get itemCount => _items.length;

  double get totalAmount {
    return _items.values.fold(
      0,
          (sum, item) => sum + (item.price * item.quantity),
    );
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      // Increase quantity if item already in cart
      _items.update(
        product.id,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      // Add new item
      _items.putIfAbsent(
        product.id,
            () => CartItem(
          id: product.id.toString(),
          title: product.title,
          price: product.price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
