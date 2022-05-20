import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/utils/themes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller){
        return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey,
              height:80 ,
              width:80 ,
              child: TextButton(
                onPressed: (){
                  Get.defaultDialog(
                    title: 'Log Out',
                    titleStyle: TextStyle(
                      color:Colors.white ,
                      fontWeight: FontWeight.bold,
                    ),
                    middleText: 'Are u sure you wat to logout ?',
                    middleTextStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                    backgroundColor: Colors.grey,
                    radius: 10,
                    textCancel: 'No',
                    cancelTextColor: Colors.white,
                    textConfirm: 'Yes',
                    confirmTextColor: Colors.white,
                    onCancel: (){
                      Get.close(1);
                    },
                    onConfirm: (){
                      controller.signOut();

                    },
                    buttonColor:Get.isDarkMode ? pinkClr : mainColor,
                  );





                },
                child: Text('Log Out' ,  style: TextStyle(
                  color: Colors.teal,),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
