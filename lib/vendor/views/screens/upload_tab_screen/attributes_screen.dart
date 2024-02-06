import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:vit_bazzar_app/providers/product_provider.dart';

class AttributeScreen extends StatefulWidget {
  @override
  State<AttributeScreen> createState() => _AttributeScreenState();
}

class _AttributeScreenState extends State<AttributeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final TextEditingController _sizeController = TextEditingController();
  bool _entered = false;
  bool _isSave = false;
  List<String> _sizeList = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          TextFormField(
            validator: ((value) {
              if (value!.isEmpty) {
                return 'Please enter the brand name';
              } else {
                return null;
              }
            }),
            onChanged: (value) {
              _productProvider.getFormData(brandName: value);
            },
            decoration: const InputDecoration(
              labelText: 'Brand',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: _sizeController,
                  onChanged: (value) {
                    setState(() {
                      _entered = true;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Size',
                  ),
                ),
              ),
              _entered == true
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _sizeList.add(_sizeController.text);
                          _sizeController.clear();
                          _entered = false;
                        });
                      },
                      child: const Text(
                        'Add Size',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    )
                  : Text('')
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          if (_sizeList.isNotEmpty)
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: _sizeList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_sizeList[index]),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _sizeList.removeAt(index);
                            _productProvider.getFormData(sizeList: _sizeList);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          if (_sizeList.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                _productProvider.getFormData(sizeList: _sizeList);
                setState(() {
                  _isSave = true;
                });
              },
              child: Text(
                _isSave ? 'Saved' : 'Save',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellowAccent,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
