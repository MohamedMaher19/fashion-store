import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/setting_controller.dart';
import 'package:moon_store/utils/reg_exp.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);

   final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: languageSettings,
              ),
              child: Icon(
                Icons.language,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextUtils(
                text: 'Language'.tr,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black)
          ],
        ),
        Container(
          width: 120,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color:Get.isDarkMode ?Colors.white : Colors.black,
            ),

          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              iconSize: 25,
              icon: Icon(Icons.arrow_drop_down_circle_outlined , color:Get.isDarkMode ?pinkClr : mainColor ,),
              items: [
                DropdownMenuItem(
                  child: Text(english , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),) ,
                  value: ene,
                ),
                DropdownMenuItem(
                  child: Text(arabic , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
                  value: ara,
                ),
                DropdownMenuItem(
                  child: Text(france , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 16),),
                  value: frf,
                ),
              ],
              onChanged: (value){
                controller.changeLanguage(value!);
                Get.updateLocale(Locale(value));
              },
              value: controller.langLocal,
            ),
          ),

        )
      ],
    ));
  }
}
