import 'package:air_plane/layout/login_page_layout.dart';
import 'package:flutter/material.dart';

import 'modules/search_result_screen.dart';
import 'modules/search_screen_module.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      routes: {
        '/search_screen': (context) => SearchScreenModule(),
        '/search_result': (context) => SearchResultScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: LoginScreenLayout(),
    );
  }
}

// This widget is the root of your application.
