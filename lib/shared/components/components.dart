
import 'package:flutter/material.dart';

Widget defaultButton({
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

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?)  validator,
  // ignore: use_function_type_syntax_for_parameters
  Function()  onSubmitted(value)?,
  IconData? prefix,
  String? label,
  IconButton? suffex,
  bool outLineBorder =false,
  bool isPassword =false,
  Color prefixIconColor =Colors.white,
  bool centerText =false,
})=>TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(
            prefix,
          color: prefixIconColor,
          ),
          suffixIcon: suffex,
      ),
      validator:validator,
      obscureText: isPassword,
      textAlign:centerText? TextAlign.center: TextAlign.start,
  );