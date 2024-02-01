import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: const Placeholder(),
      ),
    );
  }
}
