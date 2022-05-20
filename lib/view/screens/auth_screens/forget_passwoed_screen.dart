import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/utils/reg_exp.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/custom_Button.dart';
import 'package:moon_store/view/widgets/custom_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey <FormState>();
   final TextEditingController emailController = TextEditingController();
   AuthController controller = Get.put(AuthController());


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:context.theme.backgroundColor ,
      appBar:AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
        title: Text('Forget Password' , style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr , fontFamily: 'pacifico'),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
          color:Get.isDarkMode ? Colors.black : Colors.white ,

        ),
      ),
      body:Form(
        key: formKey, child:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [

              SizedBox(height: 30,),
              Text('Please Provide Your Email Id Below To Recover Yor Account ...' ,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
              ),
              SizedBox(
                height: 30,
              ),
              Image.asset('assets/images/forgetpass copy.png' , width: 270,),
              SizedBox(height: 30,),
              CustomFormField(
                controller: emailController,
                obsecure: false,
                validator: (value) {
                  if (!RegExp(validationEmail).hasMatch(value)) {
                    return 'Enter valid email';
                  } else {
                    return null;
                  }
                },
                preficIcon: Get.isDarkMode
                    ? Icon(
                  Icons.email,
                  color: Colors.teal,
                )
                    : Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
                hintText: 'Email',
              ),
              SizedBox(height: 40,),
              GetBuilder<AuthController>(builder: (controller){
                return   CustomButton(

                  text: 'Send',
                  onPressed: () {
                    if(formKey.currentState!.validate()){
                      String email = emailController.text.trim();
                      controller.resetPassword(email: email);

                      }


                  },
                );
              })


            ],

          ),
        ),
      ) ,
      ) ,
    );
  }
}
