import 'package:get/get.dart';
import 'package:moon_store/logic/bindings/auth_binding.dart';
import 'package:moon_store/logic/bindings/main_binding.dart';
import 'package:moon_store/view/screens/auth_screens/forget_passwoed_screen.dart';
import 'package:moon_store/view/screens/auth_screens/login_screen.dart';
import 'package:moon_store/view/screens/auth_screens/signup_screen.dart';
import 'package:moon_store/view/screens/main_screen.dart';
import 'package:moon_store/view/screens/welcome_screen.dart';

class AppRoute {
// initialRoutes
  static const welcome = Routes.welcomeScreen;
  static const mainScreen = Routes.mainScreen;

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
    ),GetPage(
      name: Routes.forgetPasswordScreen,
      page: () =>   ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),GetPage(
      name: Routes.mainScreen,
      page: () =>   MainScreen(),
      bindings: [AuthBinding(), MainBinding()],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
}
