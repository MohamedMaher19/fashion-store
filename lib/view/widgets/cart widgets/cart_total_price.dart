import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class CartTotalPrice extends StatelessWidget {
   CartTotalPrice({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    return  Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              children: [
                TextUtils(
                    text: 'Total',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
                Text(
                  '\$${controller.totalPrice}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    height:1.2,
                  ),
                )
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.paymentScreen);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Check Out' , style: TextStyle(
                        fontSize: 20,
                      ),),
                      SizedBox(width: 10,),
                      Icon(Icons.shopping_cart_outlined)
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: Get.isDarkMode ? pinkClr.withOpacity(0.6) : mainColor,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });

  }
}
