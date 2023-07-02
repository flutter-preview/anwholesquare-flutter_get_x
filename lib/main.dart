import 'package:flutter/material.dart';
import 'package:flutter_get_x/Controller/AppController.dart';
import 'package:flutter_get_x/Controller/LoginController.dart';
import 'package:flutter_get_x/Controller/ThemeController.dart';
import 'package:flutter_get_x/HomePage.dart';
import 'package:flutter_get_x/LoginPage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final AppController appController = Get.put(AppController());

  final ThemeController themeController = Get.put(ThemeController());

  final LoginController loginController = Get.put(LoginController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context)  {
    return GetMaterialApp(
      home: loginController.isLoggedIn ? HomePage() : LoginPage(),
      debugShowCheckedModeBanner: false,
      theme: themeController.theme.value,
    );
  }
}