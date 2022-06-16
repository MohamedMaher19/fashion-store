import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon_store/utils/constants.dart';
import 'package:moon_store/utils/themes.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaCardScreen extends StatelessWidget {
   VisaCardScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        elevation: 0,
        title: Text(
          'Visa Card',
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
      body:  WebView(
        initialUrl: 'https://accept.paymob.com/api/acceptance/iframes/399595?payment_token=$payMobfinalTokenCard',
        javascriptMode: JavascriptMode.unrestricted,

        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },

        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),

    ));
  }
  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

}
