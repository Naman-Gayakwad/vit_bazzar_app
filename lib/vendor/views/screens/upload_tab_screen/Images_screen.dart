import 'dart:io';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vit_bazzar_app/providers/product_provider.dart';

class ImageScreen extends StatefulWidget {
  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final ImagePicker picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  List<File> _images = [];
  List<String> _imageUrlList = [];

  choosimage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      print('No image selected.');
    } else {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: choosimage,
          child: const Text(
            'Choose Image',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            side: BorderSide(color: Colors.black, width: 0.5),
          ),
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: _images.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.file(
              _images[index],
              fit: BoxFit.cover,
            );
          },
        ),
        TextButton(
          onPressed: () async {
            EasyLoading.show(status: 'Uploading Images');
            for (var img in _images) {
              Reference ref =
                  _storage.ref().child('productImages').child(Uuid().v4());
              await ref.putFile(img).whenComplete(() async {
                await ref.getDownloadURL().then((value) {
                  setState(() {
                    _imageUrlList.add(value);
                  });
                });
              });
            }
            setState(() {
              _productProvider.productData['imagesUrlList'] = _imageUrlList;
              EasyLoading.dismiss();
            });
          },
          child: Text(
            'Upload Images',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
