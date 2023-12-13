import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainVendorScreen extends StatelessWidget {
  const MainVendorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
        },
        child: Text('Sign Out' , style: TextStyle(color: Colors.white),),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
        ),

      ),
     ),
    );
  }
}
