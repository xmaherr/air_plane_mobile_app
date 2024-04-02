import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.3, size.height * 0.5)
      ..cubicTo(size.width * 0.3, size.height * 0.2, size.width * 0.5,
          size.height * 0.1, size.width * 0.6, size.height * 0.3)
      ..cubicTo(size.width * 0.7, size.height * 0.1, size.width * 0.9,
          size.height * 0.1, size.width * 0.9, size.height * 0.4)
      ..cubicTo(size.width * 1.1, size.height * 0.4, size.width * 1.1,
          size.height * 0.7, size.width * 0.9, size.height * 0.6)
      ..cubicTo(size.width * 0.9, size.height * 0.9, size.width * 0.7,
          size.height * 1.1, size.width * 0.5, size.height * 0.8)
      ..cubicTo(size.width * 0.3, size.height * 0.9, size.width * 0.1,
          size.height * 0.7, size.width * 0.3, size.height * 0.5)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CloudWidget extends StatelessWidget {
  double x, y;
  CloudWidget({
    required this.x,
    required this.y,
  });
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CloudPainter(),
      size: Size(x, y), // Adjust size as needed
    );
  }
}

//---------------------
Widget defultButton({
  double width = double.infinity,
  Color background = Colors.blueAccent,
  double radius = 0,
  double textSize =15,
  required Function() function,
  required String text,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      width: double.infinity,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: textSize,
          ),
        ),
      ),
    );

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validator,
  Function() onSubmitted(value)?,
  required IconData prefix,
  String? label,
  IconButton? Suffex,
  bool outLineBorder = false,
  bool isPassword = false,
  Color prefixIconColor =Colors.black,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
       // border: outLineBorder ? OutlineInputBorder() : InputBorder.none,
        prefixIcon: Icon(prefix, color: prefixIconColor,),
        suffixIcon: Suffex,
      ),
      validator: validator,
      obscureText: isPassword,
    );
