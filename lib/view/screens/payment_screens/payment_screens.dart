import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/payment/delivery_container.dart';
import 'package:moon_store/view/widgets/payment/payment_methods.dart';
import 'package:moon_store/view/widgets/text.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'PayMent',
          style: TextStyle(fontFamily: 'pacifico', fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: "Shipping To",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              SizedBox(
                height: 10,
              ),
              DeliveryWidget(),
              SizedBox(
                height: 10,
              ),

              TextUtils(
                  text: "Payment Method",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              SizedBox(
                height: 10,
              ),
              PaymentMethodsWidget(),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: TextUtils(
                      text: 'Total Price: 150 \$',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black)),
              SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      primary: Get.isDarkMode ? pinkClr : mainColor
                    ),
                    onPressed: (){
                      Get.toNamed(Routes.paymentData);

                      // AwesomeDialog(
                      //   context: context,
                      //   dialogType: DialogType.SUCCES,
                      //   animType: AnimType.BOTTOMSLIDE,
                      //   title: 'Success',
                      //   desc: 'thanks for paying our products',
                      //   btnCancelOnPress: () {
                      //     Get.toNamed((Routes.mainScreen));
                      //   },
                      //   btnOkOnPress: () {
                      //     Get.toNamed((Routes.mainScreen));
                      //
                      //   },
                      // )..show();
                    },
                    child: Text('Pay Now' , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),),
                  ),
                ),
              )
              // TotalPriceButton(),
            ],
          ),
        ),
      ),
    );
  }
}
