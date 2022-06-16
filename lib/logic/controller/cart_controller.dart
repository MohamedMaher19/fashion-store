import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/model/product_model.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';

class CartController extends GetxController{

  var productsMap = {}.obs;

//////////////////////////////////////////////////////////////////////////////


  void addProductToCart(ProductModels productModels){

    if(productsMap.containsKey(productModels)){

      // لو ال key موجود  اذا ضفلي  المنتج في الماب الفاضيه بتاعتي
      // لو ال key اتكرر تاني اذا ضيف نفس المنتج تاني

      productsMap[productModels] += 1 ;
      // print(productsMap.value.toString());


      // enter the map to get key then get the price then nedrbha fe 3dd el products
      //  هنا انا جبت سعر كل منتج ولو كررته تاني سهره هيزيد ولكن انا عاوز اجمع بقي كل الاسعار ال موجوده في اللسته عشان احطها في المجموع
      productsMap.entries.map((e) => e.key.price * e.value).toList();
      print(productsMap.entries.map((e) => e.key.price * e.value).toList());

      // هنا بقي هستعمل نفس ال فوق ولكن مع زيادة .reduce ال هتجمعلي كل الاسعار ال موجوده في اللسته في سعر واحد بس توتال
      productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);
      print(productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2));



    }else{

      // لو ال key مش موجود خالص اذا ضيفه مره واحده بس لما اليوزر يضغط علي المنتج
      productsMap[productModels] = 1 ;
      print(productsMap.value.toString());
      print(productsMap.entries.map((e) => e.key.price * e.value).toList());

   }
  }
// متغيرات لحفظ القيم  لعرضها في ال ui
  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();
  get totalPrice => productsMap.entries.map((e) => e.key.price * e.value).toList().reduce((value, element) => value + element).toStringAsFixed(2);

////////////////////////////////////////////////////////////////////////////////////////////

  void removeProductsFromCart(ProductModels productModels){

    // هنتاكد الاول ان ال key موجود وال لا
    // الشرط التاني لو تم الضغط علي - وتم الوصول الي عدد 1 وتم الضغط علي - مره اخري يتم حزف العنصر

    if(productsMap.containsKey(productModels) && productsMap[productModels] == 1){
      productsMap.removeWhere((key, value) => key == productModels);


    }else{
      // لو عند الضغط علي - موصلش لل 1 اذا نقص واحد بس كل مره

      productsMap[productModels] -=1 ;
    }

  }

/////////////////////////////////////////////////////////////////////////////////////////////

  void removeOneProduct(ProductModels productModels){
    productsMap.removeWhere((key, value) => key == productModels);

  }

  ////////////////////////////////////////////////////////////////////////////////////////////

  void clearAllProducts(){

    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

/////////////////////////////////////////////////////////////////////

int bageQuantity(){

    if(productsMap.isEmpty){
      return 0 ;
    }else{
      return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value + element);

    }

}
}
