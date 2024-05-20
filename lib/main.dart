import 'package:air_plane/layout/login_page_layout.dart';
import 'package:air_plane/layout/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'modules/search_result_screen.dart';
import 'modules/search_screen_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/search_screen': (context) => SearchScreenModule(),
        '/search_result': (context) => const SearchResultScreen(),
        '/profile_screen': (context) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const LoginScreenLayout(),
    );
  }
}

// This widget is the root of your application.
