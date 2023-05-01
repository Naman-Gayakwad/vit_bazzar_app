import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vit_bazzar_app/main.dart';
import 'package:vit_bazzar_app/screens/mainpage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
       Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPage()));
    });
  }

  double fem = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0, 1),
              end: Alignment(0, -1),
              colors: <Color>[Color(0xff1778f2), Color(0xff2b32b2)],
              stops: <double>[0, 0.766],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 20.0),
                width: 300,
                height: 500,
                child: Image.asset(
                  '/images/loading_screen_vander.png',
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 366,
                height: 52,
                child: Image.asset(
                  '/images/loading_screen_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
