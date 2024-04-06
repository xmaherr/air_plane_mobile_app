import 'dart:math';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreenLayout extends StatelessWidget {
  var passwordController = TextEditingController();
  HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 30,
                right: 30,
                bottom: 120,
              ),
              color: const Color(0xFF161E36),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40.0),
                  const Text(
                    'Search Flight',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 0),
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFF2B3550),
                              child: Transform.rotate(
                                angle: (pi / 4),
                                child: const Icon(
                                  Icons.airplanemode_active,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Column(
                              children: List.generate(
                                10, // Number of dots you want
                                    (index) => Container(
                                  margin: const EdgeInsets.only(bottom: 3),
                                  width: 2,
                                  height: 2,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: CircleAvatar(
                              backgroundColor: const Color(0xFF2B3550),
                              child: Transform.rotate(
                                angle: 5 * (pi / 4),
                                child: const Icon(
                                  Icons.airplanemode_active,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          SizedBox(
                            width: 200,
                            child: TextFormField(
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54),
                                ),
                                labelText: 'From',
                                labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Container(
                            width: 200,
                            padding: const EdgeInsets.only(bottom: 30),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white54),
                                ),
                                labelText: 'To',
                                labelStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: (MediaQuery.of(context).size.height / 2)-30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),),
                color: Color(0xFFEEEEEE),
              ),
            ),
          ),
          Positioned(
            top: (MediaQuery.of(context).size.height/2)-100,
            left: 30,
            right: 30,
            child: Container(
              height: (MediaQuery.of(context).size.height / 2)-30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF161E36),
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail_outline,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
