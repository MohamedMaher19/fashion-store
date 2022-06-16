import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/logic/controller/category_controller.dart';
import 'package:moon_store/logic/controller/product_controller.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/screens/product_details/product_details_screen.dart';
import 'package:moon_store/view/widgets/text.dart';

class CategoryItems extends StatelessWidget {
  CategoryItems({Key? key, required this.categoreTitles}) : super(key: key);

  final String categoreTitles ;

  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  final categoryController = Get.find<CategoryController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoreTitles),
        centerTitle: true,
        backgroundColor: Get.isDarkMode? darkGreyClr : mainColor,

      ),
      body: Obx((){
        if(categoryController.isCategoryProductsLoading.value){
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );

        }else{
          return GridView.builder(
              itemCount:  categoryController.categryProductsList.length ,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.65,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 7,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return buildCardItem(
                    price: categoryController.categryProductsList[index].price,
                    image: categoryController.categryProductsList[index].image,
                    rate: categoryController.categryProductsList[index].rating.rate,
                    productId : categoryController.categryProductsList[index].id,
                    productModels:categoryController.categryProductsList[index],
                    onTap: (){
                      Get.to(ProductDetailsScreen(productModels: categoryController.categryProductsList[index],));
                    }
                );

              }
          );

        }
      })

    );
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
