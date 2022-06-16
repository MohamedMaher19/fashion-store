import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor:
        Get.isDarkMode ? Colors.pink : Colors.green.withOpacity(0.4),
        onTap: () {
          Get.toNamed((Routes.cartScreen));


        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kCOlor3,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextUtils(
                text: 'Review Cart'.tr,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black)
          ],
        ),
      ),
    );
  }
}
