import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow.shade700,
          borderRadius: BorderRadius.circular(10)
        ),
        child: PageView(
          children: const [
            Center(child: Text('Banner1')),
            Center(child: Text('Banner2')),
            Center(child: Text('Banner3')),
          ],
        ),
      ),
    );
  }
}