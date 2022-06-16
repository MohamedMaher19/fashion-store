import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class LogOutWidget extends StatelessWidget {
   LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder:(_){
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor:
          Get.isDarkMode ? Colors.pink : Colors.green.withOpacity(0.4),
          onTap: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Log Out ?',
              desc: 'are u sure u want to log out ?',
              btnCancelOnPress: () {

              },
              btnOkOnPress: () {
                controller.signOut();


              },
            )..show();

            // Get.defaultDialog(
            //   title: 'Log Out',
            //   titleStyle: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.bold,
            //   ),
            //   middleText: 'Are u sure you want to logout ?',
            //   middleTextStyle: TextStyle(
            //       fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            //   backgroundColor: Colors.grey,
            //   radius: 10,
            //   textCancel: 'No',
            //   cancelTextColor: Colors.white,
            //   textConfirm: 'Yes',
            //   confirmTextColor: Colors.white,
            //   onCancel: () {
            //     Get.back();
            //   },
            //   onConfirm: () {
            //     controller.signOut();
            //   },
            //   buttonColor: Get.isDarkMode ? pinkClr : mainColor,
            // );
          },
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              TextUtils(
                  text: 'LogOut'.tr,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black)
            ],
          ),
        ),
      );
    } );
  }
}
