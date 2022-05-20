import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/reg_exp.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/check_box_widget.dart';
import 'package:moon_store/view/widgets/custom_Bottom_Container.dart';
import 'package:moon_store/view/widgets/custom_Button.dart';
import 'package:moon_store/view/widgets/custom_form_field.dart';
import 'package:moon_store/view/widgets/text.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:context.theme.backgroundColor ,
        appBar: AppBar(
        backgroundColor:Get.isDarkMode ?   darkGreyClr : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.3,
              child: Padding(
                padding: const EdgeInsets.only(left:25 ,right:25 , top:40 ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(text:'SIGN ' , fontSize:25 , fontWeight:FontWeight.w400 , color:Get.isDarkMode ? mainColor : pinkClr , fontFamily: 'Pacifico',
                          ),
                          TextUtils(text:'UP ' , fontSize:25 , fontWeight:FontWeight.w400 , color:Get.isDarkMode ? Colors.white : Colors.black, fontFamily: 'Pacifico',
                          ),

                        ],
                      ),
                      SizedBox(height: 40,),
                      CustomFormField(
                        controller:nameController ,
                        obsecure: false,
                        validator: (value){

                          if(value.toString().length <= 2 && !RegExp(validationName).hasMatch(value)){
                            return 'Enter valid name';

                          }else{
                            return null;

                          }
                        },
                        preficIcon:Get.isDarkMode ? Icon( Icons.person , color: Colors.teal,) : Icon( Icons.person , color: Colors.pink,),
                        hintText: 'User Name',

                      ),
                      SizedBox(height: 20,),
                      CustomFormField(
                        controller:emailController ,
                        obsecure: false,
                        validator: (value){

                          if(!RegExp(validationEmail).hasMatch(value)){
                            return 'Enter valid email';

                          }else{
                            return null;

                          }
                        },
                        preficIcon:Get.isDarkMode? Icon( Icons.email , color: Colors.teal,) : Icon( Icons.email , color: Colors.pink,),
                        hintText: 'Email',

                      ),
                      SizedBox(height: 20,),
                     GetBuilder<AuthController>(

                         builder:(controller){
                           return  CustomFormField(
                             controller:passWordController ,
                             obsecure: controller.isVisiblity ? false : true ,
                             validator: (value){
                               if(value.toString().length < 6){
                                 return'password is too short' ;
                               }else{
                                 return null ;
                               }

                             },
                             preficIcon:Get.isDarkMode ? Icon( Icons.lock , color: Colors.teal,):  Icon( Icons.lock , color: Colors.pink,),
                             suffixIcon: IconButton(
                               onPressed: (){
                                 controller.visibility();
                               },
                               icon:controller.isVisiblity ?  Icon(Icons.visibility , color: Colors.pink,) : Icon(Icons.visibility_off , color: Colors.pink,) ,
                             ),
                             hintText: 'Password' );

                         }
                     ),
                      SizedBox(height: 20,),
                      SizedBox(
                        height: 50,
                      ),
                      CheckBoxWidget(),
                      SizedBox(height: 35,),
                      GetBuilder<AuthController>(
                          builder:(controller){
                            return CustomButton(
                              text: 'Sign Up',
                              onPressed: () {

                                if(controller.isCheckedBox == false){
                                  Get.snackbar('Check Box','Please , Accept terms & condition to enjoy our products' ,
                                  snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.green,
                                colorText: Colors.white );
                                  
                                }

                               else if (formKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passWordController.text;

                                  controller.signUpUsingFireBase(

                                      email: email,
                                      password: password,
                                      name: name
                                  );


                                  controller.isCheckedBox= true;
                                };

                              }
                            );

                          }
                      )



                    ],
                  ),
                ),
              ),

            ),
            BottomContainer(text: 'Already have an account ?', lastText: 'Log in' , onPressed: (){

              Get.offNamed(Routes.loginScreen);
            },)
          ],


        ),
      )
    );
  }
}
