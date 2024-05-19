import 'package:air_plane/layout/login_page_layout.dart';
import 'package:flutter/material.dart';

/*
*
*
*
* you can login and register
*
* use
*   mail: maher@gmail.com
*   password: 123
* to login and see search screen
*
*
*
*
*
*
*
*
*
* */
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
