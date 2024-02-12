import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vit_bazzar_app/providers/cart_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _cartProvider.getCartItems.length,
          itemBuilder: (context, index) {
            final cartData = _cartProvider.getCartItems.values.toList()[index];
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Image.network(
                  cartData.imagesUrlList[0],
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                title: Text(
                  cartData.productName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '₹ ${cartData.productPrice.toString()}',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Size: ${cartData.productSize}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: cartData.productQuantity == 1
                          ? null
                          : () {
                              _cartProvider.decreament(cartData);
                            },
                    ),
                    Text(
                      cartData.productQuantity.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: cartData.Quantity == cartData.productQuantity ? null :() {
                        _cartProvider.increament(cartData);
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
