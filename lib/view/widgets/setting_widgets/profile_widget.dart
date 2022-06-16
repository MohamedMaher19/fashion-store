// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:moon_store/logic/controller/auth_controller.dart';
// import 'package:moon_store/logic/controller/setting_controller.dart';
// import 'package:moon_store/view/widgets/text.dart';
//
// class ProfileWidget extends StatefulWidget {
//    ProfileWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileWidget> createState() => _ProfileWidgetState();
// }
//
// class _ProfileWidgetState extends State<ProfileWidget> {
//   final controller = Get.find<SettingController>();
//
//   final authController = Get.find<AuthController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 10,
//       child: Column(
//         children: [
//          Obx(() =>  Row(
//            children: [
//              GestureDetector(
//                onTap: (){
//                  controller.uploadImage();
//                  setState((){
//
//                  });
//                },
//                child: Container(
//                  height: 100,
//                  width: 100,
//                  decoration: BoxDecoration(
//                    color: Colors.grey,
//                    shape: BoxShape.circle,
//
//
//                  ),
//
//                  child:
//                  controller.image == null ?  Image.asset('assets/images/user1.png'):
//
//                  Image.file(controller.image! , fit: BoxFit.cover,),
//
//
//                ),
//
//              ),
//              SizedBox(width: 15,),
//              Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//
//                children: [
//                  TextUtils(text: controller.capetalize(authController.displayUserName.value), fontSize: 20, fontWeight: FontWeight.bold, color: Get.isDarkMode ?Colors.white:Colors.black),
//                  TextUtils(text: authController.displayUserEmail.value, fontSize: 13, fontWeight: FontWeight.bold, color: Get.isDarkMode ?Colors.white:Colors.black),
//
//                ],
//              )
//            ],
//          ))
//         ],
//       ),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:moon_store/logic/controller/auth_controller.dart';
// // import 'package:moon_store/logic/controller/setting_controller.dart';
// // import 'package:moon_store/view/widgets/text.dart';
// //
// // class ProfileWidget extends StatelessWidget {
// //   ProfileWidget({Key? key}) : super(key: key);
// //
// //   final controller = Get.find<SettingController>();
// //   final authController = Get.find<AuthController>();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       elevation: 10,
// //       child: Column(
// //         children: [
// //           Obx(() =>  Row(
// //             children: [
// //               GestureDetector(
// //                 onTap: (){
// //                   controller.uploadImage();
// //                 },
// //                 child: Container(
// //                   height: 100,
// //                   width: 100,
// //                   decoration: BoxDecoration(
// //                     color: Colors.grey,
// //                     shape: BoxShape.circle,
// //
// //
// //                   ),
// //                   child:controller.image == null ? Container(): Image.file(controller.image! , fit: BoxFit.cover,),
// //
// //                 ),
// //               ),
// //               SizedBox(width: 15,),
// //               Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //
// //                 children: [
// //                   TextUtils(text: controller.capetalize(authController.displayUserName.value), fontSize: 20, fontWeight: FontWeight.bold, color: Get.isDarkMode ?Colors.white:Colors.black),
// //                   TextUtils(text: authController.displayUserEmail.value, fontSize: 13, fontWeight: FontWeight.bold, color: Get.isDarkMode ?Colors.white:Colors.black),
// //
// //                 ],
// //               )
// //             ],
// //           ))
// //         ],
// //       ),
// //     );
// //   }
// // }
//
