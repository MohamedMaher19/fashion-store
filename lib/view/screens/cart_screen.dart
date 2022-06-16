import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/cart%20widgets/cart_product_card_design.dart';
import 'package:moon_store/view/widgets/cart%20widgets/cart_total_price.dart';
import 'package:moon_store/view/widgets/cart%20widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('Cart Items' , style: TextStyle(fontFamily: 'pacifico' , fontSize: 25),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
        actions: [
          IconButton(onPressed: (){
            AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Delete ?',
              desc: 'are u sure u want to delete all cart items ?',
              btnCancelOnPress: () {

              },
              btnOkOnPress: () {
                controller.productsMap.clear();


              },
            )..show();

          }, icon: Icon(Icons.delete_sweep_rounded))
        ],
      ),
      body: Obx((){
        if(controller.productsMap.isEmpty){
          return EmptyCart();
        }else{
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 580,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        // use keys inside product map to reach products to view it into cart screen
                        return CartProductCard(
                          index: index,
                          productModels:controller.productsMap.keys.toList()[index],
                          quantity: controller.productsMap.values.toList()[index],);
                      } ,
                      separatorBuilder:(context , index) => SizedBox(height: 12,
                      ),
                      itemCount: controller.productsMap.length),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: CartTotalPrice(),
                ),

              ],
            ),
          );
        }

      })
    );
  }
}
