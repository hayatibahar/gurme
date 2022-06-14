import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: Stack(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Container(
              width: context.width / 1.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/hamburger.png'),
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.06), BlendMode.modulate)),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'ARAMIZA KATIL',
                    style: GoogleFonts.bebasNeue(fontSize: 40),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextField(
                      controller: controller.nameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        hintText: 'Ad',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextField(
                      controller: controller.surnameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_box),
                        hintText: 'Soyad',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Parola',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextField(
                      controller: controller.passwordVerifyController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Parolayı doğrula',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: controller.register, child: Text('Kayıt ol')),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class CustomInputField extends StatelessWidget {
  String hintText;
  TextEditingController controller;
  CustomInputField({required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixStyle: TextStyle(),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
