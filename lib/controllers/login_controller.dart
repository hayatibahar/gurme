import 'package:firebase_core/firebase_core.dart';
import 'package:gurme/services/firestore_service.dart';
import 'package:gurme/services/user_service.dart';
import 'package:gurme/views/email_verify_page.dart';
import 'package:gurme/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../views/home_page.dart';

class LoginController extends GetxController {
  User? user = FirebaseAuth.instance.currentUser.obs();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future register() async {
    Get.to(() => RegisterPage());
  }

  void onClickSignIn() {
    print(emailController.text);
    print(passwordController.text);
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        UserService.user =
            await FirestoreService.getUser(FirebaseAuth.instance.currentUser!);
        Get.to(() => HomePage());
      } else {
        Get.to(() => EmailVerifyPage());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Hata', e.message!);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
