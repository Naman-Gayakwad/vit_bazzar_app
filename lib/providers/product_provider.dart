import 'package:flutter/widgets.dart';

class ProductProvider with ChangeNotifier {
  Map<String, dynamic> productData = {};
  getFormData({
    String? productName,
    double? productPrice,
    int? quantity,
    String? category,
    String? productDescription,
    DateTime? suheduleDate,
  }) {
    if (productName != null) {
      productData['productName'] = productName;
    }
    if (productPrice != null) {
      productData['productPrice'] = productPrice;
    }
    if (quantity != null) {
      productData['quantity'] = quantity;
    }
    if (category != null) {
      productData['category'] = category;
    }
    if (productDescription != null) {
      productData['productDescription'] = productDescription;
    }
    if (suheduleDate != null) {
      productData['suheduleDate'] = suheduleDate;
    }
  }
}
