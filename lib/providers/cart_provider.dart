import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vit_bazzar_app/screens/models/cart_attributes.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};
  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  void addProductToCart(
      String productName,
      String productId,
      double productPrice,
      int productQuantity,
      int Quantity,
      String vendorId,
      String productSize,
      List imagesUrlList,
      Timestamp suheduleDate) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existingCartItem) => CartAttr(
            productId: existingCartItem.productId,
            productName: existingCartItem.productName,
            imagesUrlList: existingCartItem.imagesUrlList,
            productQuantity: existingCartItem.productQuantity + 1,
            Quantity: existingCartItem.Quantity,
            productPrice: existingCartItem.productPrice,
            vendorId: existingCartItem.vendorId,
            productSize: existingCartItem.productSize,
            suheduleDate: existingCartItem.suheduleDate),
      );

      notifyListeners();
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartAttr(
            productId: productId,
            productName: productName,
            imagesUrlList: imagesUrlList,
            productQuantity: productQuantity,
            Quantity: Quantity,
            productPrice: productPrice,
            vendorId: vendorId,
            productSize: productSize,
            suheduleDate: suheduleDate),
      );
      notifyListeners();
    }
  }

  void increament(CartAttr cartAttr) {
    cartAttr.increaseProductQuantity();
    notifyListeners();
  }

  void decreament(CartAttr cartAttr) {
    cartAttr.decreaseProductQuantity();
    notifyListeners();
  }
}
