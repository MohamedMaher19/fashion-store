import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/main_controller.dart';
import 'package:moon_store/logic/controller/theme_controller.dart';
import 'package:moon_store/utils/themes.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);

  MainController controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor:context.theme.backgroundColor ,
        appBar: AppBar(
          elevation: 0,
          title: Text(controller.pageTitles[controller.currentIndex.value] , style: const TextStyle(fontFamily: 'pacifico' , fontSize: 25),),
          centerTitle: true,
          leading:IconButton(onPressed: (){
            ThemeChangeController().changeTheme();



          }, icon: const Icon(Icons.brightness_4_outlined)),

          actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)),
          ],
          backgroundColor: Get.isDarkMode ?    pinkClr:mainColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
           elevation: 0,
          currentIndex: controller.currentIndex.value,
          backgroundColor: Get.isDarkMode ?  darkGreyClr: Colors.white ,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home ,
                  color: Get.isDarkMode ?   pinkClr :mainColor,
                ),
                icon: Icon(Icons.home ,
                  color: Get.isDarkMode ? Colors.white : Colors.grey,
                ) ,
                label: ''
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.category ,
                  color: Get.isDarkMode ?   pinkClr :mainColor,
                ),
                icon: Icon(Icons.category ,
                  color: Get.isDarkMode ? Colors.white : Colors.grey,
                ) ,
                label: ''
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite ,
                  color: Get.isDarkMode ?  pinkClr :mainColor,
                ),

                icon: Icon(Icons.favorite ,
                  color: Get.isDarkMode ? Colors.white : Colors.grey,
                ) ,
                label: ''
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.settings ,
                  color: Get.isDarkMode ?  pinkClr :mainColor,
                ),
                icon: Icon(Icons.settings ,
                  color: Get.isDarkMode ? Colors.white : Colors.grey,
                ) ,
                label: ''
            ),
          ],
          onTap: (index){
            controller.currentIndex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children:controller.tabsScreens.value,
        ),
      );

    } );

  }
}
