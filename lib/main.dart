import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_store/language/localization.dart';
import 'package:moon_store/logic/controller/theme_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/reg_exp.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/utils/users.dart';
import 'services/dio_payment_services.dart';
import 'view/screens/welcome_screen.dart';

void main() async {
  await DioHelperPayment.init();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
 await Firebase.initializeApp();
 var token =await FirebaseMessaging.instance.getToken();
 print(token);
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>('lang') . toString()),
      fallbackLocale: Locale(ene),
      translations: Localization(),
      title: 'Moon Store',
      theme:AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeChangeController().getThemeData,
      home: const WelcomeScreen(),
      initialRoute: FirebaseAuth.instance.currentUser != null ||
          GetStorage().read<bool>('auth') == true
          ? Routes.mainScreen
          : Routes.welcomeScreen,
      getPages:AppRoute.routes,
    );
  }
}


/*
AnimatedSplashScreen(
                  splashIconSize: 450,
                  splash: Image.asset('assets/images/market.jpg' , ),
                  nextScreen: startWidget,
                  splashTransition: SplashTransition.fadeTransition,
                  backgroundColor: Colors.white,
                  duration: 7000,



                ),
 */