import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/utils/users.dart';
import 'package:moon_store/view/widgets/card_item.dart';
import 'package:moon_store/view/widgets/custom_search_bar.dart';
import 'package:moon_store/view/widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);




  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5),
            width: double.infinity,
            height: 190,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? pinkClr : mainColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 25,
                    text: 'Welcome , '.tr,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    fontSize: 25,
                    text: 'Find your pleasure'.tr,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomSearchBar()
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    text: 'Categories'.tr,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black)),
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardItem(),
        ],
      ),
    ));
  }


}
