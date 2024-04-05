import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blueAccent,
  required Function() function,
  required String text,
  double radius = 0,
  double textSize = 15,
}) =>
    Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(radius),
      ),
      width: double.infinity,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: textSize),
        ),
      ),
    );


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String? Function(String? value)? validator,
  double? width,
  IconButton? suffixIconButton,
  bool isPassword =false,
  double  borderRadiusCircular =15,
  String? label,
  Color labelTextColor = Colors.grey,
  Color backGroundColor =Colors.white,// corrected typo in parameter name
  double fontSize = 15,
  void Function(String)? onSubmitted, // corrected return type
  Icon? prefixIcon,
}) =>
    Container(
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(borderRadiusCircular),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: const Offset(0, 0), // Offset
          ),
        ],
      ),
      width: width,
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        keyboardType: textInputType,
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: labelTextColor,
              fontSize: fontSize,
            ),
            border: InputBorder.none,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIconButton
),

        validator: validator,
      ),
    );
