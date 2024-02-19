import 'package:flutter/material.dart';
import 'package:vit_bazzar_app/screens/widgets/banner_widget.dart';
import 'package:vit_bazzar_app/screens/widgets/category_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 1,
          ),
          const BannerWidget(),
          CategoryText(),
        ],
      ),
    );
  }
}
