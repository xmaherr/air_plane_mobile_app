import 'package:air_plane/DB/db.dart';
import 'package:flutter/material.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Welcome ${currentUser.firstName}',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
              ),
            ),
            Text(
              'The App Is Under Develop Now',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
