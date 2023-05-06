import 'package:vit_bazzar_app/auth.dart';
import 'package:vit_bazzar_app/screens/login.dart';
import 'package:vit_bazzar_app/screens/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:vit_bazzar_app/screens/test_homescreen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const MyLogin();
        }
      },
    );
  }
}
