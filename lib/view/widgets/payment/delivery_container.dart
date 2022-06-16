import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/logic/controller/payment_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class DeliveryWidget extends StatefulWidget {
  const DeliveryWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryWidget> createState() => _DeliveryWidgetState();
}

class _DeliveryWidgetState extends State<DeliveryWidget> {

  int radioContainerIndex = 1 ;
  bool ColorsChange = false;
  final  TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerWithRadioButton(
        modifyLocation:Container(),
          modifyIcon: Container(),
            Nameicon:Icons.perm_contact_cal ,
            phoneicon: Icons.phone_iphone,
            locationicon: Icons.location_on,
            address: 'mansoura - egypt',
          name: 'mohamed maher',
          phone: '0106525452',
          title: 'Fashion store',
          value: 1,
          color:ColorsChange ? Colors.white : Colors.grey.shade300,
          onChanged: (int ? value){
            setState((){
              radioContainerIndex = value!;
              ColorsChange = !ColorsChange;

            });

          }


        ),
        SizedBox(height:15 ,),
        Obx(() => ContainerWithRadioButton(

            modifyIcon: InkWell(
              onTap: (){

                Get.defaultDialog(
                  title:'Enter Your Phone Number',
                  titleStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  radius: 10,
                  textCancel: 'Cancel',
                  confirmTextColor: Colors.black,
                  textConfirm: 'Save',
                  cancelTextColor: Colors.black,
                  onCancel: (){
                    Get.toNamed(Routes.paymentScreen);
                  },
                  onConfirm: (){

                    controller.phoneNumber.value = phoneController.text;
                    Get.back();
                  },
                  buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                  content: Padding(padding: EdgeInsets.all(10),
                    child:TextField(
                      controller: phoneController,
                      maxLength: 11,
                      onSubmitted: (value){
                        phoneController.text = value;

                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),

                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        fillColor: Get.isDarkMode ? pinkClr.withOpacity(0.1) : mainColor.withOpacity(0.2),
                        focusColor: Colors.red,

                        prefixIcon: Icon(
                          Icons.phone_iphone,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(icon :Icon(Icons.cancel_outlined), color:Get.isDarkMode ? pinkClr : mainColor ,
                          onPressed:(){
                            phoneController.clear();

                          } ,),
                        hintText: 'Phone Number...',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    )
                    ,),

                );
              },
              child: Icon(
                Icons.contact_phone ,size: 23,color:Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8),  ),
            ) ,
            modifyLocation: InkWell(
              onTap: (){
                controller.updateLocation();
                setState((){

                });


              },
              child: Icon(
                Icons.add_location_alt_sharp ,size: 23,color:Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8),  ),
            ) ,
            address: controller.address.value,
            Nameicon:Icons.perm_contact_cal ,
            phoneicon: Icons.phone_iphone,
            locationicon: Icons.location_on,
            name: authController.displayUserName.value,
            phone: controller.phoneNumber.value,
            title: 'Delivery',
            value: 2,
            color:ColorsChange ?   Colors.grey.shade300 : Colors.white,
            onChanged: (int ? index){
              setState((){
                radioContainerIndex = index!;
                ColorsChange = !ColorsChange;

              });
              controller.updateLocation();

            }


        ),)


      ],
    );
  }

  Widget ContainerWithRadioButton({
    IconData ? Nameicon ,
    IconData ? phoneicon ,
    IconData ? locationicon ,
  required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String address,
    required String phone,
    required Widget modifyIcon,
    required Widget modifyLocation,



}){
    return Card(
      elevation: 5,
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3.0,
              blurRadius:0,
            ),

          ]

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                value: value,
                groupValue: radioContainerIndex,
                onChanged: (int ? value){
                  onChanged(value);

            },),
            SizedBox(width: 10,),
            Padding(padding: EdgeInsets.only(top: 10 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(

                  children: [
                    TextUtils(text: title, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),

                  ],
                ),
                SizedBox(height: 5,),

                Row(

                  children: [
                    Icon(Nameicon , color:Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8),),
                    SizedBox(width:10 ,),
                    TextUtils(text: name, fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),



                  ],
                ),
                SizedBox(height: 2,),

                Row(
                  children: [
                    Icon(phoneicon, color:Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8)),
                    SizedBox(width:10 ,),
                    Text('🇪🇬+20 ', style: TextStyle(color: Colors.black),),
                    TextUtils(text: phone, fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                    SizedBox(width:20,),
                    SizedBox(child: modifyIcon,)


                  ],
                ),
                SizedBox(height: 2,),
                Row(
                  children: [
                    Icon(locationicon, color:Get.isDarkMode ? pinkClr : mainColor.withOpacity(0.8)),
                    SizedBox(width:10 ,),
                    TextUtils(text: address, fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
                    SizedBox(width:30,),
                    SizedBox(child: modifyLocation,)

                  ],
                ),

                SizedBox(height:2,),



              ],
            ),
            ),
          ],
        ),

      ),
    );
  }
}
