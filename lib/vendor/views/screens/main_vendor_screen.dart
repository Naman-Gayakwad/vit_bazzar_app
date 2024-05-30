import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vit_bazzar_app/vendor/views/screens/earning_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/edit_product_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/upload_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/vendor_logout_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/vendor_order_screen.dart';

class MainVendorScreen extends StatefulWidget {
  const MainVendorScreen({super.key});

  @override
  State<MainVendorScreen> createState() => _MainVendorScreenState();
}

class _MainVendorScreenState extends State<MainVendorScreen> {
  int _pageIndex = 0;

  List<Widget> _pages = [
    const EarningScreen(),
    UploadScreen(),
    EditProductScreen(),
    VendorOrderScreen(),
    VendorLogoutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Edit',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
