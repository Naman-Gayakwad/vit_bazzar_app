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
    List<String>? imagesUrlList,
    bool? chargeShipping,
    int? shippingCharge,
    String? brandName,
    List<String>? sizeList,
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
    if (imagesUrlList != null) {
      productData['imagesUrlList'] = imagesUrlList;
    }
    if (chargeShipping != null) {
      productData['chargeShipping'] = chargeShipping;
    }
    if (shippingCharge != null) {
      productData['shippingCharge'] = shippingCharge;
    }
    if (brandName != null) {
      productData['brandName'] = brandName;
    }
    if (sizeList != null) {
      productData['sizeList'] = sizeList;
    }
    notifyListeners();
  }

  clearData() {
    productData.clear();
    notifyListeners();
  }
}
