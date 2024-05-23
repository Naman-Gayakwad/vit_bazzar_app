import 'package:flutter/cupertino.dart';
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
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _cartProvider.removeAllItems();
            },
          ),],
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _cartProvider.getCartItems.length,
        itemBuilder: (context, index) {
          final cartData = _cartProvider.getCartItems.values.toList()[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Image.network(
                cartData.imagesUrlList[0],
                width: MediaQuery.of(context).size.width * 0.15,
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              title: Text(
                cartData.productName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '₹ ${cartData.productPrice.toString()}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Size: ${cartData.productSize}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle,),
                    onPressed: cartData.productQuantity == 1
                        ? null
                        : () {
                            _cartProvider.decreament(cartData);
                          },
                  ),
                  Text(
                    cartData.productQuantity.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle, ),
                    onPressed: cartData.Quantity == cartData.productQuantity
                        ? null
                        : () {
                            _cartProvider.increament(cartData);
                          },
                  ),
                  const SizedBox(width: 20), // Add some space between the buttons
                  IconButton(
                    icon: const Icon(CupertinoIcons.cart_badge_minus),
                    onPressed: () {
                      _cartProvider.removeItem(cartData.productId);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.blue,
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ₹ ${_cartProvider.calculateTotalAmount()}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Place order
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[800],
              ),
              child: const Text(
                'Place Order',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
