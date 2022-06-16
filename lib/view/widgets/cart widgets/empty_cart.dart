import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';

class EmptyCart extends StatelessWidget {
   EmptyCart({Key? key}) : super(key: key);
  AnimationController ? animateController;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInRight(
              duration: Duration(seconds:1),
              manualTrigger: true,
              controller: ( controller ) => animateController = controller,
              child: Image.asset('assets/images/empty_cart.png'),),

          const SizedBox(
            height: 40,
          ),
          FadeInLeft(
            duration: Duration(seconds:1),
            manualTrigger: true,
            controller: ( controller ) => animateController = controller,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your Cart is ",
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Empty",
                    style: TextStyle(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),),

          const SizedBox(
            height: 10,
          ),
          FadeInRight(
            duration: Duration(seconds:1),
            manualTrigger: true,
            controller: ( controller ) => animateController = controller,
            child: Text(
              "Add items to get Started",
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),),

          const SizedBox(
            height: 50,
          ),


        ],
      ),
    );
  }
}

