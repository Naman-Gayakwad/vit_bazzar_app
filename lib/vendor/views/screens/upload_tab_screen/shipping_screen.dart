import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vit_bazzar_app/providers/product_provider.dart';

class ShippingScreen extends StatefulWidget {
  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  bool? _chargeShipping = false;

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return Column(
      children: [
        CheckboxListTile(
          title: const Text(
            'Shipping charge\'s ?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          value: _chargeShipping,
          onChanged: ((value) {
            setState(
              () {
                _chargeShipping = value;
                _productProvider.getFormData(
                  chargeShipping: _chargeShipping,
                );
              },
            );
          }),
        ),
        if (_chargeShipping == true)
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  onChanged: ((value) {
                    _productProvider.getFormData(
                      shippingCharge: int.parse(value),
                    );
                  }),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Shipping charge',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
