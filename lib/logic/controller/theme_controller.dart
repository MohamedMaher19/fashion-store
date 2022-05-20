import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeChangeController{
  final key = 'isDarkMode';
  final GetStorage boxStorage = GetStorage();



  // method for write to save themeData (1)
  saveThemeDataInBox(bool isDark){

    boxStorage.write(key, isDark);
  }


  // method to read to get themeData and return (true) or (false) (2)
 bool getThemeDataFromBox(){

   return boxStorage.read<bool>(key) ?? false;
  }

  // to use ThemeMode at the mainPage as the value (true) or (false) i read from the last function getThemeDataFromBox()

  ThemeMode get getThemeData {
    return getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;
  }


// to use the 2 functions read and write theme data
void changeTheme(){

   Get.changeThemeMode( getThemeDataFromBox () ?  ThemeMode.light : ThemeMode.dark,);

   saveThemeDataInBox(!getThemeDataFromBox());

}

}

// then go to the icon place and inside on press call ==== ThemeChangeController().changeTheme();

// then go to main and make ====  themeMode: ThemeChangeController().getThemeData

// call this line at the start of the main func ===   await GetStorage.init();