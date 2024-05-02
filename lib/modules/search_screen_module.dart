import 'dart:math';

import 'package:air_plane/modules/search_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/components/components.dart';

class SearchScreenModule extends StatefulWidget {
  const SearchScreenModule({super.key});

  @override
  State<SearchScreenModule> createState() => _SearchScreenModuleState();
}

class _SearchScreenModuleState extends State<SearchScreenModule> {
  int selectedItem = 1;

  String selectedClass = 'economy';

  TextEditingController departureController = TextEditingController();

  var returnController = TextEditingController();

  final List<String> _items = ['Business class', 'economy', 'ZZZ'];

  late FocusNode _focusNode;

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    departureController.text = DateFormat.yMMMd().format(DateTime.now());
    returnController.text =
        DateFormat.yMMMd().format(DateTime.now().add(const Duration(days: 2)));
  }

  void _onFocusChange() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    }); // You can add additional logic here based on focus change
  }

  @override
  Widget build(BuildContext context) {
    double theHight = !isFocused
        ? (MediaQuery.of(context).size.height / 2) - 30
        : (MediaQuery.of(context).size.height / 2) - 150;
    return Stack(
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
                          child: Focus(
                            focusNode: _focusNode,
                            child: TextFormField(
                              onChanged: (value) {
                                isFocused = !isFocused;
                              },
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
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 200,
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Focus(
                            focusNode: _focusNode,
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
            height: theHight,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Color(0xFFEEEEEE),
            ),
          ),
        ),
        Positioned(
          top: (MediaQuery.of(context).size.height / 2) - 100,
          left: 30,
          right: 30,
          child: Container(
            height: (MediaQuery.of(context).size.height / 2) - 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: (selectedItem == 1)
                                    ? const Color(0xFF161E36)
                                    : const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Round Trip',
                                  style: TextStyle(
                                    color: (selectedItem == 1)
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedItem = 1;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: (selectedItem == 2)
                                    ? const Color(0xFF161E36)
                                    : const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 40,
                              child: Center(
                                child: Text(
                                  'One Way',
                                  style: TextStyle(
                                    color: (selectedItem == 2)
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedItem = 2;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: (selectedItem == 3)
                                    ? const Color(0xFF161E36)
                                    : const Color(0xFFEEEEEE),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Multi City',
                                  style: TextStyle(
                                    color: (selectedItem == 3)
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedItem = 3;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 90)),
                                initialDate: DateTime.now(),
                              ).then((value) {
                                departureController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Departure',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            controller: departureController,
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          width: 130,
                          height: 50,
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 90)),
                                initialDate: DateTime.now(),
                              ).then((value) {
                                returnController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Return',
                              labelStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            controller: returnController,
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedClass,
                      items: _items.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedClass = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Class',
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors.grey), // Customize border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors
                                  .grey), // Customize enabled border color
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Colors
                                  .grey), // Customize focused border color
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: defaultButton(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchResultScreen(),
                            ),
                          );
                        },
                        text: 'searchhh',
                        background: const Color(0xFFFF8B3D),
                        radius: 10),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
