import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Widget defultButton({
  double width= double.infinity,
  Color background = Colors.blueAccent,
  required  Function() function,
  required String text,
  double radius=0,
  double textSize =15,
})=>Container(
  decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(radius),
  ),

  width: double.infinity,
  child: MaterialButton(onPressed: function,
    child: Text(
     text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: textSize
      ),
    ),
  ),
);

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)  validator,
  Function()  onSubmitted(value)?,
  required IconData prefix,
  String? label,
  IconButton? Suffex,
  bool outLineBorder =false,
  bool isPassword =false,
  Color prefixIconColor =Colors.white,
})=>TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
          labelText: label,
          border:outLineBorder? OutlineInputBorder(): InputBorder.none,
          prefixIcon: Icon(
            prefix,
          color: prefixIconColor,
          ),
          suffixIcon: Suffex,
      ),
      validator:validator,
      obscureText: isPassword,
  );