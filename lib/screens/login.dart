import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:vit_bazzar_app/screens/mainpage.dart';
import 'package:vit_bazzar_app/screens/test_homescreen.dart';
import 'package:vit_bazzar_app/utils/square_tile.dart';
import 'package:vit_bazzar_app/utils/reusable_widget.dart';
import 'package:vit_bazzar_app/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
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

Widget buildLoginBtn() {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      elevation: 5,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      backgroundColor: const Color(0xFF1778F2));
  return Container(
    // padding: const EdgeInsets.only(left25),
    child: ElevatedButton(
      onPressed: () => print('Login Pressed'),
      style: style,
      child: const Text(
        'LOGIN',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget buildSignUpBtn() {
  return GestureDetector(
    onTap: () => print('sign up button was pressed'),
    child: RichText(
      text: const TextSpan(children: [
        TextSpan(
            text: "Dont't have an Account?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        TextSpan(
            text: 'Sign Up',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))
      ]),
    ),
  );
}

class _MyLoginState extends State<MyLogin> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController(); 
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
                                      'Welcome Back',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 32),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Sign in to your account',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    const SizedBox(height: 50),
                                    reusableTextField(
                                        "Enter Your Email",
                                        Icons.email,
                                        false,
                                        _emailTextController),
                                    const SizedBox(height: 20),
                                    reusableTextField(
                                        "Enter Your Password",
                                        Icons.lock,
                                        true,
                                        _passwordTextController),
                                    buildForgotPassBtn(),
                                    firebaseUIButton(context, "Sign In", () {
                                      FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                              email: _emailTextController.text,
                                              password:
                                                  _passwordTextController.text)
                                          .then((value) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainPage()));
                                      }).onError((error, stackTrace) {
                                        print("Error ${error.toString()}");
                                      });
                                    }),
                                    const SizedBox(height: 30),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:  [
                                        RoundedLoadingButton(
                                          controller: googleController, 
                                          onPressed: (){
                                            Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MainPage()));
                                          }, 
                                          child:Image.asset('assets/images/google_logo.png')
                                          ),

                                        // SquareTile(
                                        //     imagePath:
                                        //         'assets/images/google_logo.png', controller: null,),
                                        // SizedBox(width: 20),
                                        // SquareTile(
                                        //     imagePath:
                                        //         'assets/images/apple_logo.png', controller: null,)
                                      ],
                                    ),
          
                                    const SizedBox(height: 20),
                                    signUpOption()
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

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70, fontSize: 18)),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyRegister()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  //   Widget forgetPassword(BuildContext context) {
  //   return Container(
  //     width: MediaQuery.of(context).size.width,
  //     height: 35,
  //     alignment: Alignment.bottomRight,
  //     child: TextButton(
  //       child: const Text(
  //         "Forgot Password?",
  //         style: TextStyle(color: Colors.white70),
  //         textAlign: TextAlign.right,
  //       ),
  //       onPressed: () => Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => ResetPassword())),
  //     ),
  //   );
  // }
}
// RoundedLoadingButton(
                                        //   controller: googleController, 
                                        //   onPressed: () {
                                        //     Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             MainPage()));
                                        //   }, 
                                        //   child: SquareTile(
                                        //     imagePath:
                                        //         'assets/images/google_logo.png', controller: null,),),
                                         // RoundedLoadingButton(
                                        //   controller: googleController, 
                                        //   onPressed: () {
                                        //     Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             MainPage()));
                                        //   }, 
                                        //   child: SquareTile(
                                        //     imagePath:
                                        //         'assets/images/apple_logo.png', controller: null,),),