import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moon_store/logic/controller/theme_controller.dart';
import 'package:moon_store/routes/routes.dart';
import 'package:moon_store/utils/themes.dart';
import 'view/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
