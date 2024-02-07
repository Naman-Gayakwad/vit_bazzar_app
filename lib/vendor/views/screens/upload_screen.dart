import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vit_bazzar_app/providers/product_provider.dart';
import 'package:vit_bazzar_app/vendor/views/screens/main_vendor_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/Images_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/attributes_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/general_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/shipping_screen.dart';

class UploadScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.yellow,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: 'General',
                  ),
                  Tab(
                    text: 'Shipping',
                  ),
                  Tab(
                    text: 'Attributes',
                  ),
                  Tab(
                    text: 'Images',
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              GeneralScreen(),
              ShippingScreen(),
              AttributeScreen(),
              ImageScreen(),
            ]),
            bottomSheet: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () async {
                    EasyLoading.show(status: 'Saving...');
                    if (_formKey.currentState!.validate()) {
                      final productId = Uuid().v4();
                      await _firestore
                          .collection('products')
                          .doc(productId)
                          .set({
                        'productId': productId,
                        'productName':
                            _productProvider.productData['productName'],
                        'productDescription':
                            _productProvider.productData['productDescription'],
                        'productPrice':
                            _productProvider.productData['productPrice'],
                        'productCategory':
                            _productProvider.productData['category'],
                        'productBrand':
                            _productProvider.productData['brandName'],
                        'productSize': _productProvider.productData['sizeList'],
                        'productQuantity':
                            _productProvider.productData['quantity'],
                        'suheduleDate':
                            _productProvider.productData['suheduleDate'],
                        'chargeShipping':
                            _productProvider.productData['chargeShipping'],
                        'shippingCharge':
                            _productProvider.productData['shippingCharge'],
                        'imagesUrlList':
                            _productProvider.productData['imagesUrlList'],
                        'createdDate': Timestamp.now(),
                      }).whenComplete(() {
                        _productProvider.clearData();
                        EasyLoading.dismiss();
                        _formKey.currentState!.reset();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return MainVendorScreen();
                          }),
                        );
                      });
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    side: BorderSide(color: Colors.black, width: 0.1),
                  )),
            )),
      ),
    );
  }
}
