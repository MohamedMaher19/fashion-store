import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/logic/controller/cart_controller.dart';
import 'package:moon_store/logic/payment_logic/payment_cubit.dart';
import 'package:moon_store/logic/payment_logic/payment_state.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/reg_exp.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/custom_Button.dart';
import 'package:moon_store/view/widgets/custom_form_field.dart';

class PaymentData extends StatelessWidget {
  PaymentData({Key? key}) : super(key: key);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  AuthController controller = Get.put(AuthController());
  final cartcontroller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentCubit(),
        child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: context.theme.backgroundColor,
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
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 40),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomFormField(
                                controller: firstNameController,
                                obsecure: false,
                                validator: (value) {
                                  if (value.toString().length <= 2 &&
                                      !RegExp(validationName).hasMatch(value)) {
                                    return 'Enter valid name';
                                  } else {
                                    return null;
                                  }
                                },
                                preficIcon: Get.isDarkMode
                                    ? Icon(
                                        Icons.person,
                                        color: Colors.teal,
                                      )
                                    : Icon(
                                        Icons.person,
                                        color: Colors.pink,
                                      ),
                                hintText: 'First Name',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomFormField(
                                controller: lastNameController,
                                obsecure: false,
                                validator: (value) {
                                  if (!RegExp(validationName).hasMatch(value)) {
                                    return 'Enter valid Name';
                                  } else {
                                    return null;
                                  }
                                },
                                preficIcon: Get.isDarkMode
                                    ? Icon(
                                        Icons.person,
                                        color: Colors.teal,
                                      )
                                    : Icon(
                                        Icons.person,
                                        color: Colors.pink,
                                      ),
                                hintText: 'Last Name',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomFormField(
                                controller: emailController,
                                obsecure: false,
                                validator: (value) {
                                  if (!RegExp(validationEmail)
                                      .hasMatch(value)) {
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
                              CustomFormField(
                                controller: phoneController,
                                obsecure: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter valid Phone';
                                  } else {
                                    return null;
                                  }
                                },
                                preficIcon: Get.isDarkMode
                                    ? Icon(
                                        Icons.phone_iphone,
                                        color: Colors.teal,
                                      )
                                    : Icon(
                                        Icons.phone_iphone,
                                        color: Colors.pink,
                                      ),
                                hintText: 'Phone',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomFormField(
                                controller: priceController,
                                obsecure: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter valid price';
                                  } else {
                                    return null;
                                  }
                                },
                                preficIcon: Get.isDarkMode
                                    ? Icon(
                                        Icons.price_change,
                                        color: Colors.teal,
                                      )
                                    : Icon(
                                        Icons.price_change,
                                        color: Colors.pink,
                                      ),
                                hintText: 'Price',
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Center(
                                child: SizedBox(
                                  height: 70,
                                  width: 200,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 2,
                                        primary: Get.isDarkMode
                                            ? mainColor
                                            : pinkClr),
                                    onPressed: () {
                                      if(formKey.currentState!.validate()){
                                        PaymentCubit.get(context).getFirstToken(
                                            priceController.text,
                                            firstNameController.text,
                                            lastNameController.text,
                                            emailController.text,
                                            phoneController.text);
                                        Get.toNamed(Routes.toggleScreen);

                                      }

                                    },
                                    child: Text(
                                      'Go to Pay',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
// AwesomeDialog(
//   context: context,
//   dialogType: DialogType.SUCCES,
//   animType: AnimType.BOTTOMSLIDE,
//   title: 'Success',
//   desc: 'thanks for paying our products',
//   btnCancelOnPress: () {
//     Get.toNamed((Routes.mainScreen));
//   },
//   btnOkOnPress: () {
//     Get.toNamed((Routes.mainScreen));
//
//   },
// )..show();
