import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/logic/controller/main_controller.dart';
import 'package:moon_store/logic/controller/payment_controller.dart';
import 'package:moon_store/logic/controller/profile_controller.dart';
import 'package:moon_store/logic/controller/setting_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(MainController());
    Get.put(SettingController());
    Get.put(ProfileController());
    Get.put(PaymentController() , permanent: true);
  }


}