import 'package:air_plane/firebase_options.dart';
import 'package:air_plane/layout/home_layout.dart';
import 'package:air_plane/layout/login_page_layout.dart';
import 'package:air_plane/layout/register_screen_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // to check if u R logged in or not
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        if (kDebugMode) {
          print('User is currently signed out!');
        }
      } else {
        if (kDebugMode) {
          print('User is signed in!');
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreenLayout(),
      routes: {
        '/homePage': (context) => const HomeScreenLayout(),
        '/signUp': (context) => const RegisterScreenLayout(),
        '/login': (context) => const LoginScreenLayout(),
      },
    );
  }
}
