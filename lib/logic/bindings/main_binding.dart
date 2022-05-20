import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/logic/controller/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(MainController());
  }


}