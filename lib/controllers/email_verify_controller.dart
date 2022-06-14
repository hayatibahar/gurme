import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gurme/services/firestore_service.dart';
import 'package:gurme/services/user_service.dart';
import 'package:gurme/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmailVerifyController extends GetxController {
  bool isEmailVerified = false;
  late Timer timer;

  @override
  void onInit() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      FirebaseAuth.instance.currentUser!.sendEmailVerification();
    }

    timer = Timer.periodic(
      Duration(seconds: 3),
      (_) => checkEmailVerified(),
    );
    super.onInit();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (isEmailVerified) {
      timer.cancel();
      UserService.user =
          await FirestoreService.getUser(FirebaseAuth.instance.currentUser!);
      Get.to(() => HomePage());
    }
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
