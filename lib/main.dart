import 'package:air_plane/layout/login_page_layout.dart';
import 'package:flutter/material.dart';

import 'package:air_plane/layout/register_screen_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreenLayout(),
    );
  }
}

// This widget is the root of your application.
