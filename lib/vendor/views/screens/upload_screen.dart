import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vit_bazzar_app/providers/product_provider.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/Images_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/attributes_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/general_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_tab_screen/shipping_screen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabs: const [
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
                onPressed: () {},
                child: const Text('Save', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  side: BorderSide(color: Colors.black, width: 0.5),
                )),
          )),
    );
  }
}
