// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vit_bazzar_app/providers/product_provider.dart';
// import 'package:vit_bazzar_app/screens/login.dart';
// import 'package:vit_bazzar_app/screens/register.dart';
// import 'package:vit_bazzar_app/screens/mainpage.dart';
import 'package:vit_bazzar_app/screens/splash.dart';
import 'package:vit_bazzar_app/vendor/views/screens/main_vendor_screen.dart';
// import 'package:vit_bazzar_app/vendor/views/auth/vendor_register_screen.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) {
      return ProductProvider();
    }),
  ], child: const MyApp()));
}
// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MainVendorScreen(),
      ),
    );
  }
}
