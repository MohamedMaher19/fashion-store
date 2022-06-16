import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/view/widgets/product_details_widgets/add_cart.dart';
import 'package:moon_store/view/widgets/product_details_widgets/clothes_info.dart';
import 'package:moon_store/view/widgets/product_details_widgets/image_slider.dart';
import 'package:moon_store/view/widgets/product_details_widgets/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen({Key? key, required this.productModels}) : super(key: key);

 final ProductModels productModels ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(imageUrl:productModels.image ,),
            ClothesInfo(
              rate: productModels.rating.rate,
              productId:productModels.id ,
              title: productModels.title,
              description: productModels.description,
            ),

              SizeList(),
               AddToCard(
                 price: productModels.price,
                 productModels: productModels,
               ),
            ],
          ),
        ),
      ),
    );
  }
}
