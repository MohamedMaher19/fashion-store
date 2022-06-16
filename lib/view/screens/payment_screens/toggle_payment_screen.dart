import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
        title: Text(
          'Payment',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){

                      Get.toNamed(Routes.visaCardScreen);
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/new2.png' , ) , width: 200,height: 200,),
                          SizedBox(height: 10,),
                          Text('Pay With Card' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){

                      Get.toNamed(Routes.refernceCodeScreen);

                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    margin: EdgeInsets.all(10),

                    child: Center(
                      child: Column(
                        children: [
                          Image(image: AssetImage('assets/images/refcode.jpg')),
                          SizedBox(height: 10,),
                          Text('Pay With RefrenceCode' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
