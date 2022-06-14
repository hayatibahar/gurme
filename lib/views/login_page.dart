import 'package:gurme/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/images/hamburger.png',
                    width: context.width / 1.9),
                SizedBox(height: 20),
                Text(
                  'GURME',
                  style: GoogleFonts.bebasNeue(fontSize: 60),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: controller.signIn, child: Text('Giriş Yap')),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: controller.register,
                  child: Text(
                    'Aramıza katılmak için tıkla !',
                    style: GoogleFonts.lobster(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
