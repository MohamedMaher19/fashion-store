import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/setting_controller.dart';
import 'package:moon_store/logic/controller/theme_controller.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class DarkMode extends StatelessWidget {
   DarkMode({Key? key}) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          iconWidget(),
          Switch(
            activeTrackColor:Get.isDarkMode ? pinkClr: mainColor,
            activeColor: Get.isDarkMode ? pinkClr: mainColor,
            value: controller.switchValue.value,
            onChanged: (value){
              ThemeChangeController().changeTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      );
    });

}


Widget iconWidget(){

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: darkSettings,
          ),
          child: Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 20,),
        TextUtils(text: 'Dark Mode'.tr, fontSize: 18, fontWeight: FontWeight.bold, color:Get.isDarkMode ? Colors.white: Colors.black)

      ],

    );
}
}
