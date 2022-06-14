import 'package:firebase_core/firebase_core.dart';
import 'package:gurme/firebase_options.dart';
import 'package:gurme/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'GURME',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepOrangeAccent,
            brightness: Brightness.dark,
          ),
        ),
        home: LoginPage());
  }
}
