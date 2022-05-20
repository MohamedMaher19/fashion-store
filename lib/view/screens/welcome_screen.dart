import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/widgets/text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
         children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
            'assets/images/home.webp',
            fit: BoxFit.cover,
          ),
        ),
          Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child:  Center(
                  child: TextUtils(
                    fontSize: 35,
                    fontWeight: FontWeight.normal,
                    text: 'Welcome',
                    fontFamily: 'Pacifico',
                    color: Colors.white70,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      TextUtils(
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                        text: 'Hamza',
                        fontFamily: 'Pacifico',

                        color: Colors.white70,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextUtils(
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                        text: 'Store',
                        fontFamily: 'Pacifico',

                        color: Colors.teal,
                      ),
                    ]),
              ),
              const SizedBox(
                height: 200,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      )),
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  child:  TextUtils(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    text: 'Get Start',
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   TextUtils(
                      text: 'Don\'t have an account ?  ',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed(Routes.signUpScreen);
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white70,
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
