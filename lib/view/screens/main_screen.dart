import 'package:badges/badges.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/logic/controller/main_controller.dart';
import 'package:moon_store/logic/controller/theme_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';

class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);

  MainController controller = Get.find<MainController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor:context.theme.backgroundColor ,
        appBar: AppBar(
          elevation: 0,
          title: Text(controller.pageTitles[controller.currentIndex.value] , style: const TextStyle(fontFamily: 'pacifico' , fontSize: 25),),
          centerTitle: true,
          leading:Container(),

          actions: [
        Obx(() {
          return Badge(
            position: BadgePosition.topEnd(top: 0, end: 10),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              cartController.bageQuantity().toString() ,
              style: TextStyle(color: Colors.white),
            ),
            child:  Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(onPressed: (){
                Get.toNamed(Routes.cartScreen);
              }, icon: const Icon(Icons.shopping_cart)),
            ),
          );
        })

          ],
          backgroundColor: Get.isDarkMode ?    pinkClr:mainColor,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){},
        //   child: Image.asset('assets/images/logo.jpg' , width: 40,height: 40, fit: BoxFit.fitHeight,),
        //
        //   backgroundColor: Colors.white,
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: controller.currentIndex.value,
          onTap: (index){
            controller.currentIndex.value = index!;
          },
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          // fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor: Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.home_filled, color:Get.isDarkMode? pinkClr: mainColor,), activeIcon: Icon(Icons.home_filled, color: Colors.red,), title: Text("Home")),
            BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.category, color:Get.isDarkMode? pinkClr: mainColor,), activeIcon: Icon(Icons.category, color: Colors.deepPurple,), title: Text("Categories")),
            BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Icon(Icons.favorite, color:Get.isDarkMode? pinkClr: mainColor,), activeIcon: Icon(Icons.favorite, color: Colors.indigo,), title: Text("Favorites")),
            BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.settings, color:Get.isDarkMode? pinkClr: mainColor,), activeIcon: Icon(Icons.settings, color: Colors.green,), title: Text("Settings"))
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children:controller.tabsScreens.value,
        ),
      );

    } );

  }
}

/*

floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.dashboard, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.red,), title: Text("Home")),
            BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.access_time, color: Colors.black,), activeIcon: Icon(Icons.access_time, color: Colors.deepPurple,), title: Text("Logs")),
            BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Icon(Icons.folder_open, color: Colors.black,), activeIcon: Icon(Icons.folder_open, color: Colors.indigo,), title: Text("Folders")),
            BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.menu, color: Colors.black,), activeIcon: Icon(Icons.menu, color: Colors.green,), title: Text("Menu"))
        ],
      ),
 */



////////////////////////////////////////////////////////////////////////////////////
/*
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
 */
