import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vit_bazzar_app/vendor/models/vendor_user_models.dart';
import 'package:vit_bazzar_app/vendor/views/auth/vendor_register_screen.dart';
import 'package:vit_bazzar_app/vendor/views/screens/main_vendor_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final CollectionReference _vendorsStream =
        FirebaseFirestore.instance.collection('vendors');

    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          if (!snapshot.data!.exists) {
            return VendorRegistrationScreen();
          }

          VendorUserModel vendorUserModel = VendorUserModel.fromJson(
              snapshot.data!.data()! as Map<String, dynamic>);

          if (vendorUserModel.approved == true) {
            return MainVendorScreen();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    vendorUserModel.storeImage.toString(),
                    width: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  vendorUserModel.bussinessName.toString(),
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Your application has been sent to shop admin\n Admin will get back to you soon',
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  child: const Text('Logout'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () async {
                    await _vendorsStream
                        .doc(_auth.currentUser!.uid)
                        .delete()
                        .then((value) => print("User Deleted"))
                        .catchError(
                            (error) => print("Failed to delete user: $error"));
                    await _auth.signOut();
                  },
                  child: const Text('Delete Account'),
                ),
                TextButton(
                  onPressed: () async {
                    await _vendorsStream
                        .doc(_auth.currentUser!.uid)
                        .update({'approved': true})
                        .then((value) => print("User Approved"))
                        .catchError(
                            (error) => print("Failed to approve user: $error"));
                    await _auth.signOut();
                  },
                  child: const Text('Approve Account'),
                ),
              ],
            )),
          );
        },
      ),
    );
  }
}
