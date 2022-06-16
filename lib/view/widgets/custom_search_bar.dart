import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/product_controller.dart';
import 'package:moon_store/utils/themes.dart';

class CustomSearchBar extends StatelessWidget {
   CustomSearchBar({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(

        builder:(_) => TextField(
          onChanged: (searchName){
            controller.addSearchProductToList(searchName);
          },
          controller: controller.searchController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            suffixIcon:controller.searchController.text.isNotEmpty ? IconButton(onPressed: (){
              controller.clearSearchBar();
              }, icon: Icon(Icons.close , color: Colors.black,)) : null ,
            prefixIcon: Icon(
              Icons.search,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            hintText: 'Search For Products ...',
            hintStyle: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ) );
  }
}
