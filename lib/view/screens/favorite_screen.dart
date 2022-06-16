import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/product_controller.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:animate_do/animate_do.dart';
import 'package:moon_store/view/widgets/empty_fav_widget.dart';
class FavoritesScreen extends StatefulWidget {
   FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
   final controller = Get.put(ProductController());

   AnimationController ? animateController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
          if (controller.favoritesList.isEmpty) {

            return EmptyFavorites();

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
              AwesomeDialog(
                context: context,
                dialogType: DialogType.WARNING,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Delete ?',
                desc: 'are u sure u want to remove this item from favorites ?',
                btnCancelOnPress: () {

                },
                btnOkOnPress: () {
                  controller.manageFavorites(productId);


                },
              )..show();

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
