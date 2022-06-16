import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:moon_store/logic/controller/auth_controller.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:moon_store/view/screens/profile_screen.dart';
import 'package:moon_store/view/widgets/setting_widgets/contact_us_widget.dart';
import 'package:moon_store/view/widgets/setting_widgets/dark_mode_widget.dart';
import 'package:moon_store/view/widgets/setting_widgets/language_widget.dart';
import 'package:moon_store/view/widgets/setting_widgets/logout_widget.dart';
import 'package:moon_store/view/widgets/setting_widgets/my_favorites_widget.dart';
import 'package:moon_store/view/widgets/setting_widgets/profile_details_widget.dart';
import 'package:moon_store/view/widgets/setting_widgets/profile_widget.dart';
import 'package:moon_store/view/widgets/setting_widgets/review_cart.dart';
import 'package:moon_store/view/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          // ProfileWidget(),
          SizedBox(height: 20,),
          TextUtils(text: 'GENERAL'.tr, fontSize: 18, fontWeight: FontWeight.bold, color:Get.isDarkMode? pinkClr: mainColor),
          SizedBox(height: 20,),
          EditProfileIcon(),
          SizedBox(height: 15,),
           DarkMode(),
          SizedBox(height: 15,),
           LanguageWidget(),
          SizedBox(height:25,),
          MyFvorites(),
          SizedBox(height: 30,),
          MyCart(),
          SizedBox(height: 30,),
          LogOutWidget(),
          SizedBox(height: 30,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color:Get.isDarkMode? pinkClr: mainColor)
            ),

            elevation: 7,
              child: ExpansionTile(
                collapsedIconColor: Colors.green,
                childrenPadding: EdgeInsets.all(7),
                title: ContactUs() ,
                children: [
                buildSocialMediaIcons(),
              ],),),

          // SizedBox(height: 30,),



        ],
      ),
    );
  }







  Widget buildSocialMediaIcons() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Row(
        children: [
          buildIcon(FontAwesomeIcons.facebook, 'https://www.facebook.com/mohamed.maher.3386/'),
          SizedBox(width: 30,),
          buildIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/mohamed-maher9/'),
          SizedBox(width:30,),
          buildIcon(FontAwesomeIcons.github, 'https://github.com/MohamedMaher19', ),
        ],
      ),
    );
  }
  Widget buildIcon(IconData icon, String url) {
    return GestureDetector(
      onTap: () => launchURL(url),
      child: Icon(icon, color:Get.isDarkMode ? pinkClr: Colors.cyan, size: 35,),

    );
  }
  Future<void> launchURL(String url) async {
   if( await canLaunch(url))  {
     await launch(url);
   }else {
     throw 'Could not launch $url';
   }
  }
}


