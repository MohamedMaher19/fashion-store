import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moon_store/model/faceBook_model.dart';
import 'package:moon_store/routes/routes.dart';

class AuthController extends GetxController {
  bool isVisiblity = false;
  bool isCheckedBox = false;
  var displayUserName = '';
  var displayUserPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn =GoogleSignIn();
  FaceBookModel? faceBookModel;


  // for saving user login in or not

  var isSignedIn = false;
  final GetStorage authbox = GetStorage();

  ///////////////////////////////////////////////////////



  void visibility() {
    isVisiblity = !isVisiblity;

    update();
  }

  ////////////////////////////////////////////////

  void checkedBox() {
    isCheckedBox = !isCheckedBox;

    update();
  }

  ////////////////////////////////////////////////

  void signUpUsingFireBase({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });

      Get.snackbar('looks good :)', 'Successfully Logined',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);

      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = ' Provided Password is too weak.. ';
      } else if (error.code == 'email-already-in-use') {
        message = ' Account Already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      // هنا بهندل الايرور بتاع الفاير بيز عشان اظهره بشكل كويس

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // هنا الايرور ال هيطلع للمستخدم ملوش علاقه بالايرور بتاع الفاير بيز ممكن يكون بسبب النت او غيره

    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  ////////////////////////////////////////////////

  void logInUsingFireBase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName = auth.currentUser!.displayName!);

      isSignedIn = true;
      authbox.write('auth', isSignedIn ); // to save signIn state with fireBase



      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = ' Invalid Password... PLease try again! ';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  ////////////////////////////////////////////////

  void googleSignUp()async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;

      isSignedIn = true;
      authbox.write('auth', isSignedIn ); // to save signIn state with google

      update();
      Get.snackbar('looks good :)', 'Successfully Logined',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
      Get.offNamed(Routes.mainScreen);
    }catch(error){
      print(error.toString());
      Get.snackbar(
        'Some thing went wrong :( !',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );


    }
  }

  ////////////////////////////////////////////////

  void faceBookSignUp()async {



    final LoginResult loginResult = await FacebookAuth.instance.login();

    if(loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);

      print('=============');
      print(faceBookModel!.email);
      print(faceBookModel!.name);
      print('=============');

      isSignedIn = true;
      authbox.write('auth', isSignedIn ); // to save signIn state with facebook

      update();

      Get.snackbar('looks good :)', 'Successfully Logined',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);

      Get.offNamed(Routes.mainScreen);
    }
  }

  ////////////////////////////////////////////////

  void resetPassword({
    required String email,
  }) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );



      update();

      Get.back();

      Get.snackbar('Message Send', 'Please Check Your Email Address',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);

    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'user-not-found') {
        message =
            ' Account does not exists for that $email.. Create your account by signing up..';
      }  else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  ////////////////////////////////////////////////

  void signOut() async{
    try{
      await auth.signOut();  // sign out from firebase
      await googleSignIn.signOut(); // sign out from google
      await FacebookAuth.i.logOut(); // sign out feom faceBook

      displayUserName = '';    // make user name & photo empty as he is log out
      displayUserPhoto = '';   // make user name & photo empty as he is log out


      isSignedIn = false;
      authbox.remove('auth'); // to remove

      update();
      Get.offNamed(Routes.welcomeScreen);



    }catch(error){

      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

    }

  }



}
