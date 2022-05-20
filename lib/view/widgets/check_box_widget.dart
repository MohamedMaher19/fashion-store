import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/view/widgets/text.dart';

class CheckBoxWidget extends StatelessWidget {
   CheckBoxWidget({Key? key}) : super(key: key);

  AuthController controller = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
  return GetBuilder<AuthController>(
     builder: (_){
       return   Row(
         children: [
           GestureDetector(
             onTap: (){
               controller.checkedBox();

             },
             child: Container(
               height: 35,
               width: 35,
               decoration: BoxDecoration(
                 color: Colors.grey.shade200,
                 borderRadius: BorderRadius.circular(10.0),
               ),
               child:controller.isCheckedBox ? Get.isDarkMode ? Image.asset('assets/images/check.png') : Icon(Icons.done , color: Colors.pink,size: 32,): Container(),
             ),
           ),
           SizedBox(width: 15,),
           Row(
             children: [
               TextUtils(text: 'I accept ', fontSize: 16 , fontWeight: FontWeight.normal, color:Get.isDarkMode ? Colors.white : Colors.black),
               Text('Terms & conditions' , style: TextStyle(
                 fontSize: 16 , fontWeight: FontWeight.normal,  color:Get.isDarkMode ? Colors.white : Colors.black, decoration: TextDecoration.underline,

               ),

               )
             ],
           )

         ],
       );
     },
   );
  }
}
