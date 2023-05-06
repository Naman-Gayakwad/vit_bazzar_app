import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vit_bazzar_app/screens/login.dart';
import 'package:vit_bazzar_app/screens/mainpage.dart';
import 'package:vit_bazzar_app/screens/test_homescreen.dart';
import 'package:vit_bazzar_app/utils/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/reusable_widget.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

Widget buildName() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Text(
          'Username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.person_2_rounded,
                color: Colors.black,
              ),
              hintText: 'Username',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 20),
        child: const Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
            ]),
        height: 60,
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

Widget buildForgotPassBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
        onPressed: () => print('Forgot Password Pressed'),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.white),
        )),
  );
}

Widget buildRegisterBtn() {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      elevation: 5,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      backgroundColor: const Color(0xFF1778F2));
  return Container(
    // padding: const EdgeInsets.only(left25),
    child: ElevatedButton(
      onPressed: () => print('Register Pressed'),
      style: style,
      child: const Text(
        'Register',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
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
                alignment: Alignment.topCenter,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                      child: Align(
                        child: SizedBox(
                          width: 400,
                          height: 700,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              color: const Color(0x16fcfcfc),
                            ),
                            child: SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 60),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Create Account',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                    const SizedBox(height: 50),
                                    reusableTextField(
                                        "Enter Your Username",
                                        Icons.person_2_rounded,
                                        false,
                                        _userNameTextController),
                                    const SizedBox(height: 20),
                                    reusableTextField(
                                        "Enter Your Email Id",
                                        Icons.email,
                                        false,
                                        _emailTextController),
                                    const SizedBox(height: 20),
                                    reusableTextField(
                                        "Enter Your Password",
                                        Icons.lock,
                                        true,
                                        _passwordTextController),
                                    const SizedBox(height: 20),
                                    firebaseUIButton(context, "Sign Up", () {
                                      FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text)
                                          .then((value) {
                                        print("Created New Account");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeScreen()));
                                      }).onError((error, stackTrace) {
                                        print("Error ${error.toString()}");
                                      });
                                    }),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SquareTile(
                                            imagePath:
                                                'assets/images/google_logo.png'),
                                        SizedBox(width: 20),
                                        SquareTile(
                                            imagePath:
                                                'assets/images/apple_logo.png')
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    loginOption(),
                                  ],
                                )),
                          ),
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }

  Row loginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already have an account?",
            style: TextStyle(color: Colors.white70, fontSize: 18)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyLogin()));
          },
          child: const Text(
            " Sign In",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
