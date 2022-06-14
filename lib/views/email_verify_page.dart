import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/email_verify_controller.dart';

class EmailVerifyPage extends StatelessWidget {
  EmailVerifyController controller = Get.put(EmailVerifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Image.asset('assets/images/hamburger.png',
                  width: context.width / 1.5),
              const SizedBox(height: 20),
              Text(
                'GURME',
                style: GoogleFonts.bebasNeue(fontSize: 60),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Mailine gönderilen doğrulama linkine tıkla ! ',
                style: GoogleFonts.lobster(color: Colors.deepOrange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
