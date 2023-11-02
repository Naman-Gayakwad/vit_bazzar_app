import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import '../screens/landing_screen.dart';

class VendorAuthScreen extends StatelessWidget {
  const VendorAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<User?>(
  stream: FirebaseAuth.instance.authStateChanges(),
  // If the user is already signed-in, use it as initial data
  initialData: FirebaseAuth.instance.currentUser,
  builder: (context, snapshot) {
    // User is not signed in
    if (!snapshot.hasData) {
      return SignInScreen(
        providerConfigs: [
          EmailProviderConfiguration(),
          PhoneProviderConfiguration(),
          GoogleProviderConfiguration(clientId: '1:673785503092:android:7c74766a4600b52a6b6021'),
          AppleProviderConfiguration(),
        ]
      );
    }

    // Render your application if authenticated
    return LandingScreen();
  },
);
  }
}