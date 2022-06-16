import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/category_controller.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/category/category_items.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({Key? key}) : super(key: key);

   final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value){
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? mainColor : pinkClr,
          ),
        );
      }else{
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context , index) {
                return InkWell(
                    onTap: (){
                      // the best place to call this func when press on the card to get all product for specific category
                      controller.getAllCategoriesProducts(controller.categoryNamesList[index]);
                      Get.to(CategoryItems(categoreTitles: controller.categoryNamesList[index],));


                    },
                    child: Card(
                      shadowColor:Colors.grey,
                      elevation: 5,
                      child: Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image:DecorationImage(
                            image:NetworkImage(controller.categoryImages[index]),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 10 ,bottom: 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(controller.categoryNamesList[index], style: TextStyle(
                              backgroundColor: Colors.black38,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),

                      ),
                    ));
              },
              separatorBuilder:(context , index) => SizedBox(height: 10,),
              itemCount: controller.categoryNamesList.length
          ),
        );

      }
    });
  }

}
