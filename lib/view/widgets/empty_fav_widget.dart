import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class EmptyFavorites extends StatelessWidget {
   EmptyFavorites({Key? key}) : super(key: key);
  AnimationController ? animateController;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
            duration: Duration(seconds:1),

            manualTrigger: true,
            controller: ( controller ) => animateController = controller,
            child:SizedBox(
              height: 100,
              width: 150,

              child: Icon(FontAwesomeIcons.heartCircleExclamation , size: 120,),
            ),  ),
          const SizedBox(
            height: 50,
          ),
          FadeInRight(
              duration: Duration(seconds:1),

              manualTrigger: true,
              controller: ( controller ) => animateController = controller,
              child:  Text('Please, Add your favorites products',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 18,
                  )) ),
        ],
      ),

    );
  }
}
