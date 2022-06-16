import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/logic/controller/category_controller.dart';
import 'package:moon_store/logic/controller/product_controller.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }




}