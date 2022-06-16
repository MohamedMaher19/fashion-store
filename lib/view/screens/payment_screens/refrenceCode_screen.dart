import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:moon_store/utils/constants.dart';
import 'package:moon_store/utils/themes.dart';

class RefernceCodeScreen extends StatelessWidget {
  const RefernceCodeScreen({Key? key}) : super(key: key);
// new
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
        title: Text(
          'Refernce Code',
          style: TextStyle(
              color: Get.isDarkMode ? mainColor : pinkClr,
              fontFamily: 'pacifico'),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          color: Get.isDarkMode ? Colors.black : Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You Can Pay At Any Market' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
            SizedBox(height: 20,),
            Text('This Is Your Reference Code' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),),
            SizedBox(height: 15,),
            Card(
              elevation: 12,
              shape: Border.all(color: Colors.grey , width: 2),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text('$RefCode' , style: TextStyle(fontSize: 40 , fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
