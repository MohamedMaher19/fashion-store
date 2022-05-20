import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/reg_exp.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/custom_Bottom_Container.dart';
import 'package:moon_store/view/widgets/custom_Button.dart';
import 'package:moon_store/view/widgets/custom_form_field.dart';
import 'package:moon_store/view/widgets/text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:context.theme.backgroundColor ,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr :  Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'Log ',
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Get.isDarkMode ?    mainColor : pinkClr ,
                              fontFamily: 'Pacifico',
                            ),
                            TextUtils(
                              text: 'In ',
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color:
                                  Get.isDarkMode ?  Colors.white : Colors.black ,
                              fontFamily: 'Pacifico',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
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
                        SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (controller) {
                          return CustomFormField(
                              controller: passWordController,
                              obsecure: controller.isVisiblity ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'password is too short';
                                } else {
                                  return null;
                                }
                              },
                              preficIcon: Get.isDarkMode
                                  ? Icon(
                                      Icons.lock,
                                      color: Colors.teal,
                                    )
                                  : Icon(
                                      Icons.lock,
                                      color: Colors.pink,
                                    ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisiblity
                                    ? Icon(
                                        Icons.visibility,
                                        color: Colors.pink,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.pink,
                                      ),
                              ),
                              hintText: 'Password');
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment:Alignment.centerRight
                          ,
                          child: TextButton(onPressed: (){
                            Get.toNamed(Routes.forgetPasswordScreen);


                          }, child: TextUtils(
                            text: 'Forget Password ?',
                            fontSize:15 ,
                            fontWeight:FontWeight.normal ,
                            color: Get.isDarkMode ? Colors.black : Colors.white,

                          )),
                        ),
                        SizedBox(
                          height:15,
                        ),
                        GetBuilder<AuthController>(

                            builder:(controller){
                              return CustomButton(
                                text: 'LOG IN',
                                onPressed: () {

                                  if (formKey.currentState!.validate()) {

                                    String email = emailController.text.trim();
                                    String password = passWordController.text;

                                    controller.logInUsingFireBase(
                                        email: email, password: password);
                                  };
                                } );

                            }),


                        SizedBox(height: 30,),
                        TextUtils(text: '- OR -', fontSize:15, fontWeight:FontWeight.bold , color: Get.isDarkMode ? Colors.white : Colors.black ),
                        SizedBox(height:30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(builder: (controller){
                              return InkWell(

                                child: Image.asset('assets/images/facebook.png'),
                                onTap: (){
                                  controller.faceBookSignUp();


                                },
                              );
                            }),
                            SizedBox(width: 30,),

                           GetBuilder<AuthController>(builder: (controller){
                             return  InkWell(child: Image.asset('assets/images/google.png', ) ,

                               onTap: (){

                               controller.googleSignUp();
                               },);
                           })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                text: 'Don\'t have an account ?',
                lastText: 'Sign Up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              )
            ],
          ),
        ));
  }
}
