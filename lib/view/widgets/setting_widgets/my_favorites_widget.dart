import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/screens/favorite_screen.dart';
import 'package:moon_store/view/widgets/text.dart';

class MyFvorites extends StatelessWidget {
  const MyFvorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor:
        Get.isDarkMode ? Colors.pink : Colors.green.withOpacity(0.4),
        onTap: () {
         Get.toNamed((Routes.favoritesSettingScreen));

        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: pinkClr,
              ),
              child: Icon(
                Icons.favorite_outline,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextUtils(
                text: 'Favorites'.tr,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black)
          ],
        ),
      ),
    );
  }
}

