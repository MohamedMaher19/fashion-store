
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/logic/controller/profile_controller.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/custom_Button.dart';
import 'package:moon_store/view/widgets/custom_form_field.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  double screenHeight = 0;
  double screenWidth = 0;
  final cartController = Get.find<CartController>();
  final profileController = Get.find<ProfileController>();
   String birth = 'Date of Birth ...';




  final TextEditingController emailController = TextEditingController();
  final TextEditingController firsNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('My Profile' , style: const TextStyle(fontFamily: 'pacifico' , fontSize: 25),),
          centerTitle: true,
          actions: [

          ],
          backgroundColor: Get.isDarkMode ?    pinkClr:mainColor,
        ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder:(profileController) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      profileController.getProfileImage();

                    },
                    child: Container(
                      width: 130,
                      height: 130,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: profileController.profileImage == null ?
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:  NetworkImage(
                            'https://images.unsplash.com/photo-1653242816429-fd9393b49bb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=890&q=80'))

                            :Image.file(profileController.profileImage! , fit: BoxFit.cover,) ,
                      //FileImage(profileController.profileImage)

                      ),
                    ),
                  ),

                SizedBox(height: 25,),

                CustomProfileField(controller: firsNameController,
                    hintText: 'First Name',
                    validator: (value) {},
                    obsecure: false,
                    preficIcon: Icon(Icons.person, color: Get.isDarkMode? pinkClr : mainColor,)),
                SizedBox(height: 20,),

                CustomProfileField(controller: lastNameController,
                    hintText: 'Last Name',
                    validator: (value) {},
                    obsecure: false,
                    preficIcon: Icon(Icons.person, color: Get.isDarkMode? pinkClr : mainColor,)),
                SizedBox(height: 20,),

                CustomProfileField(controller: addressController,
                    hintText: 'Address',
                    validator: (value) {},
                    obsecure: false,
                    preficIcon: Icon(Icons.location_city, color: Get.isDarkMode? pinkClr : mainColor,)),
                SizedBox(height: 20,),

                GestureDetector(
                  onTap: () {
                    showDatePicker(context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: mainColor,
                                secondary: mainColor,
                                onSecondary: Colors.white,

                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary: mainColor,
                                ),
                              ),
                              textTheme: TextTheme(
                                headline4: TextStyle(
                                  fontFamily: 'pacifico',
                                ),
                                overline: TextStyle(
                                  fontFamily: 'pacifico',
                                ),
                                button: TextStyle(
                                    fontFamily: 'pacifico'
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        }
                    ).then((value) {
                      setState(() {
                        birth = DateFormat('MM/dd/yyyy').format(value!);
                      });
                    });
                  },
                  child: Container(

                    height: kToolbarHeight,
                    width: screenWidth,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.only(left: 11),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.black26,
                        )
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        birth,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                CustomProfileButton(onPressed: () async {
                  String firstName = firsNameController.text;
                  String lastName = lastNameController.text;
                  String address = addressController.text;
                  String birthDate = birth;

                  if (firstName.isEmpty) {
                    showSnackBar('Please enter your first name !');
                  } else if (lastName.isEmpty) {
                    showSnackBar('Please enter your last name !');
                  } else if (birthDate.isEmpty) {
                    showSnackBar('Please enter your birth date !');
                  } else if (address.isEmpty) {
                    showSnackBar('Please enter your address !');
                  } else {}
                }, text: 'Save',),
                SizedBox(height: 20,),

                CustomProfileButton(onPressed: () {
                  profileController.uploadImage();

                }, text: 'update',),
              ],
            ),
          );
        })
    );
  }

  void showSnackBar(String text){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
          content: Text(
        text,
      ))
    );
  }

}
