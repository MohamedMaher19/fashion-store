import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class BottomContainer extends StatelessWidget {
  BottomContainer({Key? key, required this.text, this.onPressed, required this.lastText})
      : super(key: key);
  final String text;
  final String lastText;
   Function()  ? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.teal : Colors.pink,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          TextButton(
              onPressed: onPressed,
              child:  Text(
                lastText,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
          )
        ],
      ),
    );
  }
}
