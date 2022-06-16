import 'package:get/get.dart';
import 'package:moon_store/logic/bindings/auth_binding.dart';
import 'package:moon_store/logic/bindings/main_binding.dart';
import 'package:moon_store/logic/bindings/product_binding.dart';
import 'package:moon_store/logic/bindings/profile_binding.dart';
import 'package:moon_store/view/screens/auth_screens/fav_setting_screen.dart';
import 'package:moon_store/view/screens/auth_screens/forget_passwoed_screen.dart';
import 'package:moon_store/view/screens/auth_screens/login_screen.dart';
import 'package:moon_store/view/screens/auth_screens/signup_screen.dart';
import 'package:moon_store/view/screens/cart_screen.dart';
import 'package:moon_store/view/screens/category_screen.dart';
import 'package:moon_store/view/screens/favorite_screen.dart';
import 'package:moon_store/view/screens/main_screen.dart';
import 'package:moon_store/view/screens/payment_screens/add_payment_data.dart';
import 'package:moon_store/view/screens/payment_screens/payment_screens.dart';
import 'package:moon_store/view/screens/payment_screens/refrenceCode_screen.dart';
import 'package:moon_store/view/screens/payment_screens/toggle_payment_screen.dart';
import 'package:moon_store/view/screens/payment_screens/visaCard_screen.dart';
import 'package:moon_store/view/screens/profile_screen.dart';
import 'package:moon_store/view/screens/welcome_screen.dart';

import '../view/widgets/setting_widgets/profile_details_widget.dart';

class AppRoute {
// initialRoutes
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;
  static const paymentScreen = Routes.paymentScreen;
  static const favoritesScreen = Routes.favoritesSettingScreen;
  static const profileScreen = Routes.profileScreen;
  static const categoryScreen = Routes.categoryScreen;
  static const paymentData = Routes.paymentData;
  static const toggleScreen = Routes.toggleScreen;
  static const visaCardScreen = Routes.visaCardScreen;
  static const refernceCodeScreen = Routes.refernceCodeScreen;

  // pages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ), GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),

    ), GetPage(
      name: Routes.signUpScreen,
      page: () =>  SignUpScreen(),
      binding: AuthBinding(),
    ),
     GetPage(
      name: Routes.cartScreen,
      page: () =>  CartScreen(),
      bindings:[
        AuthBinding(),
        ProductBinding()
      ],
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () =>   ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () =>   MainScreen(),
      bindings: [AuthBinding(), MainBinding() , ProductBinding()],
    ),GetPage(
      name: Routes.paymentScreen,
      page: () =>  PaymentScreen(),
      bindings:[
        AuthBinding(),
        MainBinding() ,
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.favoritesSettingScreen,
      page: () =>  FavoritesSettingScreen(),
      bindings:[
        AuthBinding(),
        MainBinding() ,
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.profileScreen,
      page: () =>  EditProfileScreen(),
      bindings:[
        AuthBinding(),
        MainBinding() ,

      ],
    ),
    GetPage(
      name: Routes.categoryScreen,
      page: () =>  CategoryScreen(),
      bindings:[
        AuthBinding(),
        MainBinding() ,
        ProductBinding(),
      ],
    ),GetPage(
      name: Routes.paymentData,
      page: () =>  PaymentData(),
      bindings:[
        AuthBinding(),
        MainBinding() ,

      ],
    ),
    GetPage(
      name: Routes.toggleScreen,
      page: () =>  ToggleScreen(),
      bindings:[
        AuthBinding(),
        MainBinding() ,

      ],
    ),  GetPage(
      name: Routes.visaCardScreen,
      page: () =>  VisaCardScreen(),
      bindings:[
        AuthBinding(),
        MainBinding() ,

      ],
    ),  GetPage(
      name: Routes.refernceCodeScreen,
      page: () =>  RefernceCodeScreen(),
      bindings:[
        AuthBinding(),
        MainBinding() ,

      ],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const favoritesSettingScreen = '/favoritesSettingScreen';
  static const paymentScreen = '/paymentScreen';
  static const profileScreen = '/profileScreen';
  static const categoryScreen = '/categoryScreen';
  static const paymentData = '/paymentData';
  static const toggleScreen = '/toggleScreen';
  static const visaCardScreen = '/visaCardScreen';
  static const refernceCodeScreen = '/refernceCodeScreen';
}
//CategoryScreen