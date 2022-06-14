import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gurme/modals/user.dart';
import 'package:gurme/services/firestore_service.dart';
import 'package:gurme/services/user_service.dart';
import 'package:gurme/views/email_verify_page.dart';
import 'package:gurme/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordVerifyController = TextEditingController();
  void register() async {
    if (passwordController.text != passwordVerifyController.text) {
      Get.snackbar('Hata', 'Şifreler eşleşmiyor');
      return;
    } else if (nameController.text.isEmpty) {
      Get.snackbar('Hata', 'Ad alanı boş bırakılamaz');
      return;
    } else if (surnameController.text.isEmpty) {
      Get.snackbar('Hata', 'Soyad alanı boş bırakılamaz');
      return;
    } else if (emailController.text.isEmpty) {
      Get.snackbar('Hata', 'Email alanı boş bırakılamaz');
      return;
    } else if (!emailController.text.isEmail) {
      Get.snackbar('Hata', 'Lütfen geçerli bir email adresi giriniz');
      return;
    } else if (passwordController.text.isEmpty) {
      Get.snackbar('Hata', 'Parola alanı boş bırakılamaz');
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      FirebaseUser user = FirebaseUser(
          name: nameController.text,
          surname: surnameController.text,
          email: emailController.text);

      await FirestoreService.createOrUpdateUser(user);

      UserService.user = user;

      Get.to(() => EmailVerifyPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Hata', e.message.toString());
    }

    //Get.to(() => LoginPage());
  }
}
