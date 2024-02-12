import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  final String productId;
  final String productName;
  final List imagesUrlList;
  int productQuantity;
  int Quantity;
  final double productPrice;
  final String vendorId;
  final String productSize;
  Timestamp suheduleDate;

  CartAttr(
      {required this.productId,
      required this.productName,
      required this.imagesUrlList,
      required this.productQuantity,
      required this.Quantity,
      required this.productPrice,
      required this.vendorId,
      required this.productSize,
      required this.suheduleDate});

  void increaseProductQuantity() {
    productQuantity++;
    notifyListeners();
  }

  void decreaseProductQuantity() {
    productQuantity--;
    notifyListeners();
  }
}
