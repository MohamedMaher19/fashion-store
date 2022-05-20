
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:moon_store/view/screens/category_screen.dart';
import 'package:moon_store/view/screens/favorite_screen.dart';
import 'package:moon_store/view/screens/home_screen.dart';
import 'package:moon_store/view/screens/setting_screen.dart';

class MainController extends GetxController{

RxInt currentIndex = 0.obs;

final tabsScreens = [
  HomeScreen(),
  CategoryScreen(),
  FavoritesScreen(),
  SettingScreen(),

].obs;

final pageTitles = [
  'Moon Store',
  'Categories',
  'Favorites',
  'Settings',

].obs;

}