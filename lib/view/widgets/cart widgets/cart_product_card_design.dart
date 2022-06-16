import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/utils/themes.dart';

class CartProductCard extends StatelessWidget {
   CartProductCard({Key? key, required this.productModels, required this.index, required this.quantity, }) : super(key: key);

  final ProductModels productModels ;
  final int index ;
  final int quantity ;

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15,top: 10),
      height: 130,
      
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr.withOpacity(0.6) : mainColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 130,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(productModels.image) , fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModels.title, style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),) ,
                SizedBox(height: 20,),
                Text('\$${controller.productSubTotal [index].toStringAsFixed(2)}' , style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),) ,
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){

                    controller.removeProductsFromCart(productModels);

                  }, icon: Icon(Icons.remove_circle_outlined)),
                  Text('$quantity' , style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),) ,
                  IconButton(onPressed: (){
                    controller.addProductToCart(productModels);
                  }, icon: Icon(Icons.add_circle_outlined)),
                ],
              ),
              IconButton(onPressed: (){
                controller.removeOneProduct(productModels);
              }, icon: Icon(Icons.delete_forever) , color: Get.isDarkMode ? Colors.white : Colors.red,)
            ],
          )
        ],
      ),
   );
  }
}
