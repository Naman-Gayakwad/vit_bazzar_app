import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login_background.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              alignment: const Alignment(0, 0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all()
                ),
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 1,sigmaY: 1),
                  child: Align(child: 
                  SizedBox(
                    width: 400,
                    height: 500,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(color: Color(0xfffffffff)),
                        color: Color(0x16fcfcfc),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top:10),
                            alignment: const Alignment(0, -1),
                            child: Text(
                              'Welcome Back!',
                              style: TextStyle(fontSize: 32, color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),)
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
