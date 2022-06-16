import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class AddToCard extends StatelessWidget {
  AddToCard({Key? key, required this.price, required this.productModels})
      : super(key: key);

  final double price;
  final ProductModels productModels;
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: 'Price',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
              Text(
                '\$ $price',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          SizedBox(width: 20,),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                ),
                  onPressed: () {
                  controller.addProductToCart(productModels);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Add To Cart' ,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,

                      ),

                      ),
                      Icon(Icons.shopping_cart),
                       

                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
