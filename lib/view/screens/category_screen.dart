import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/view/widgets/category/category_widget.dart';
import 'package:moon_store/view/widgets/text.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 15, right: 15),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 15 , ),
                child: TextUtils(
                    text: 'Category',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            SizedBox(height: 20,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
