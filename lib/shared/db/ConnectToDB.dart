import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../models/user_model.dart';

class ConnectToDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(String email, String password, BuildContext context) async {
    print("Attempting to log in");
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("-><><><><>>>>>>>>>>>>${credential.user?.uid}");
      await fetchUserData(credential.user);

      Navigator.of(context).pushReplacementNamed('/home_page');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Error: ${e.message}');
      }
    }
  }

  Future<void> fetchUserData(User? user) async {
    print("Fetching user data");

    if (user != null) {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user.uid).get();
      print("->>>>>>>>>>>>>>${userDoc.id  }");

      if (userDoc.exists) {
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;

        UserModel userModel = UserModel(
          uid: userDoc.id,
          name: "${userData['first_name']} ${userData['last_name']}",
          email: userData['email'],
          phone: userData['phone'],
          gender: userData['gender'],
          bookings: List<String>.from(userData['bookings'] ?? []),
        );

        UserModel.setCurrentUser(userModel);
        print("User data fetched successfully");
        print("User: ${userModel.name}");
      } else {
        print("No user document found in Firestore");
      }
    } else {
      print("User is null");
    }
  }
}
