import 'dart:math';

import 'package:air_plane/shared/components/components.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF161E36),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            'Search Result',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          SizedBox(
            width: 380,
            child: Row(
              children: [
                Transform.rotate(
                  angle: pi/4,
                  child: const Icon(
                    Icons.airplanemode_active_outlined,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
                const SizedBox(width: 100,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Transform.rotate(
                    angle: pi/2,
                    child: const Icon(
                      Icons.airplanemode_active_outlined,
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),
                const SizedBox(width: 100,),
                Transform.rotate(
                  angle: 90,
                  child: const Icon(
                    Icons.airplanemode_active_outlined,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFD9D7D7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        for (int i = 0; i < 10; i++)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: ticketBuilder(),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}
