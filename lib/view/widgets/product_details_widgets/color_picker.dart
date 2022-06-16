import 'package:flutter/material.dart';

class ColorPiker extends StatelessWidget {
  const ColorPiker({Key? key, required this.outBorder, required this.color}) : super(key: key);

  final bool outBorder;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // to make outer border for circles

      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outBorder ? Border.all(color: color , width: 2) : null,
    ),
    child: Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),

    ),
    );
  }
}
