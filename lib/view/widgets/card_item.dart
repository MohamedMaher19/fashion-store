import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/logic/controller/product_controller.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/screens/product_details/product_details_screen.dart';
import 'package:moon_store/view/widgets/text.dart';

class CustomCardItem extends StatelessWidget {
  CustomCardItem({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? mainColor : pinkClr,
          ),
        );
      } else {
        return Expanded(
          child:controller.searchList.isEmpty && controller.searchController.text.isNotEmpty ?Get.isDarkMode ?
          Image.asset('assets/images/38061-search.gif'):
          Image.asset('assets/images/86813-no-results-found.gif'):
          GridView.builder(
              itemCount: controller.searchList.isEmpty ? controller.productList.length : controller.searchList.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.65,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 7,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                if(controller.searchList.isEmpty){
                  return buildCardItem(
                      price: controller.productList[index].price,
                      image: controller.productList[index].image,
                      rate: controller.productList[index].rating.rate,
                      productId : controller.productList[index].id,
                      productModels:controller.productList[index],
                      onTap: (){
                        Get.to(ProductDetailsScreen(productModels: controller.productList[index],));
                      }
                  );

                }else{
                  return buildCardItem(
                      price: controller.searchList[index].price,
                      image: controller.searchList[index].image,
                      rate: controller.searchList[index].rating.rate,
                      productId : controller.searchList[index].id,
                      productModels:controller.searchList[index],
                      onTap: (){
                        Get.to(ProductDetailsScreen(productModels: controller.searchList[index],));
                      }
                  );
                }
              }),
        );
      }
    });
  }


  Widget buildCardItem({
    required ProductModels productModels,
    required String image,
    required double price,
    required double rate,
    required int productId,
    required Function() onTap,

  }) {
    return Padding(
        padding: EdgeInsets.all(5),
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3.0,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Obx(() =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.manageFavorites(productId);


                            },
                            icon:controller.isFavorited(productId) ? Icon(Icons.favorite ,
                            color:Get.isDarkMode ?   Colors.red : mainColor) : Icon(Icons.favorite_outline),
                             color: Colors.black),
                        IconButton(
                          onPressed: () {
                            cartController.addProductToCart(productModels);
                          },
                          icon: Icon(Icons.add_shopping_cart_rounded),
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                      ],
                    ),
                ),


                Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ $price',
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 47,
                        decoration: BoxDecoration(
                          color: Get.isDarkMode ? pinkClr : mainColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3.0, right: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextUtils(
                                  text: '$rate',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
