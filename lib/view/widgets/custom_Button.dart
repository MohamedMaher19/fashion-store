import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/view/widgets/text.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),),
          primary:Get.isDarkMode ? Colors.teal : Colors.pink,
          minimumSize: Size(300, 55),
        ),
        onPressed: onPressed,
        child: TextUtils(
          text: text,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ));
  }
}
