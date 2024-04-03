import 'package:flutter/material.dart';


class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  bool _isDataSheetVisible = false;

  @override
  void initState() {
    super.initState();
    // Set a delay before showing the data sheet
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isDataSheetVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Sheet Example'),
      ),
      body: Stack(
        children: [
          // Your main content
          const Center(
            child: Text('Main Content'),
          ),
          // Data sheet
          AnimatedOpacity(
            opacity: _isDataSheetVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.1, 0.0),
                end: const Offset(0.0, 1.0),
              ).animate(CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.fastOutSlowIn,
              )),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                height: _isDataSheetVisible ? MediaQuery.of(context).size.height * 0.6 : 0.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text('Data Sheet'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
