import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class EditProfileIcon extends StatelessWidget {
  const EditProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor:
        Get.isDarkMode ? Colors.pink : Colors.green.withOpacity(0.4),
        onTap: () {
          Get.toNamed((Routes.profileScreen));


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
                Icons.person_pin_rounded,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextUtils(
                text: 'My Profile'.tr,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black)
          ],
        ),
      ),
    );
  }
}

