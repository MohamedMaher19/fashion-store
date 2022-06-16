import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moon_store/utils/reg_exp.dart';

class SettingController extends GetxController{

var switchValue = false.obs;

var storage = GetStorage();
var langLocal = ene;

 File ? image;
 final imagePicker = ImagePicker() ;



// ميثود لجعل اي اسم هيجيلي في البروفايل اول حرف منه كابتل

  String capetalize (String profileName){
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }


// language functions

 // @override
 // void onInit()async{
 //    super.onInit();
 //    langLocal = await getLanguage;
 //
 // }


  // write

 void saveLanguage(String lang)async{
    await storage.write('lang', lang);


 }

 //read

Future <String> get getLanguage async{
    return await storage.read('lang');
    
}


  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }

    if (typeLang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }

  Future <void>uploadImage()async{
    var pickedImage =await imagePicker.getImage(source: ImageSource.gallery);
    if(pickedImage !=null){
      image = File(pickedImage.path);


    }else{
      return null;
    }
    update();



  }



}