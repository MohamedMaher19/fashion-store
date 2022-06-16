import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/product_controller.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.productId,
      required this.rate, required this.description})
      : super(key: key);

  final String title;
  final String description;
  final controller = Get.find<ProductController>();
  final int productId;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(
                () => Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorites(productId);
                    },
                    child: controller.isFavorited(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              TextUtils(
                  text: '$rate',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              SizedBox(
                width: 10,
              ),
              RatingBar.builder(
                initialRating: rate,
                itemSize: 20,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ],
          ),
          SizedBox(height: 20,),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimCollapsedText: ' Show More',
            trimMode: TrimMode.Line,
            trimExpandedText: ' Show Less ',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style:
            TextStyle(
              fontSize: 15,
              height: 1.5,
              color: Get.isDarkMode ? Colors.white : Colors.black,

          ),

          )],
      ),
    );
  }
}
