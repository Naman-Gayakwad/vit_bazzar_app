import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vit_bazzar_app/providers/product_provider.dart';
import 'package:intl/intl.dart';

class GeneralScreen extends StatefulWidget {
  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> _categoryList = [];

  _getCategories() async {
    return await _firestore
        .collection('categories')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        setState(() {
          _categoryList.add(doc['categoryName']);
        });
      });
    });
  }

  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  String formateDate(date) {
    final outPutDataFormat = DateFormat('dd-MM-yyyy');
    final outPutDate = outPutDataFormat.format(date);
    return outPutDate;
  }

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  _productProvider.getFormData(productName: value);
                }, //product name
                decoration: InputDecoration(
                  labelText: 'Enter the product name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  _productProvider.getFormData(
                      productPrice: double.parse(value));
                }, //product price
                decoration: InputDecoration(
                  labelText: 'Enter the product Price',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  _productProvider.getFormData(quantity: int.parse(value));
                }, //product quantity
                decoration: InputDecoration(
                  labelText: 'Enter the product Quantity',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                items: _categoryList
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _productProvider.getFormData(category: value);
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select the category',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 10,
                maxLength: 800,
                onChanged: ((value) {
                  _productProvider.getFormData(productDescription: value);
                }),
                decoration: InputDecoration(
                  labelText: 'Enter the product Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(5000))
                          .then((value) {
                        setState(() {
                          _productProvider.getFormData(suheduleDate: value);
                        });
                      });
                    },
                    child: Text('Suhedule'),
                  ),
                  if (_productProvider.productData['suheduleDate'] != null)
                    Text(
                      formateDate(_productProvider.productData['suheduleDate']),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
