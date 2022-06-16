import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/logic/controller/product_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';

class FavoritesSettingScreen extends StatelessWidget {
  FavoritesSettingScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProductController());
  final cartController = Get.find<CartController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('My Favorites' , style: const TextStyle(fontFamily: 'pacifico' , fontSize: 25),),
        centerTitle: true,

        actions: [
          Obx(() {
            return Badge(
              position: BadgePosition.topEnd(top: 0, end: 10),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                cartController.bageQuantity().toString() ,
                style: TextStyle(color: Colors.white),
              ),
              child:  Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(onPressed: (){
                  Get.toNamed(Routes.cartScreen);
                }, icon: const Icon(Icons.shopping_cart)),
              ),
            );
          })

        ],
        backgroundColor: Get.isDarkMode ?    pinkClr:mainColor,
      ),
      body: Obx(
            () {
          if (controller.favoritesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/images/heart.png"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Please, Add your favorites products.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 18,
                      )),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return favoriteItem(
                  image: controller.favoritesList[index].image,
                  price: controller.favoritesList[index].price,
                  title: controller.favoritesList[index].title,
                  productId: controller.favoritesList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return Container();
              },
              itemCount: controller.favoritesList.length,
            );
          }
        },
      ),
    );
  }


  Widget favoriteItem({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        color: Colors.tealAccent.withOpacity(0.4),
        elevation: 1,
        child: Container(
          width: double.infinity,
          height: 100,
          child: Row(
            children: [
              SizedBox(
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text('\$ $price',
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

              ),
              IconButton(onPressed: () {
                controller.manageFavorites(productId);
              },
                  icon: Icon(Icons.favorite, color:Get.isDarkMode ? Colors.red : mainColor , size: 30, ))
            ],
          ),
        ),
      ),
    );
  }
}
//
