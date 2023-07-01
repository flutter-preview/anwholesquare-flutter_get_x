import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
    final _box = GetStorage();
    final themeModeKey = "isDarkMode";
    bool _loadTheme() => _box.read(themeModeKey) ?? false;

    ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.dark
    );

    ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.red,
      brightness: Brightness.light
    );

    ThemeData get theme => _loadTheme() ? darkTheme : lightTheme;

    void toggleTheme () {
      _box.write(themeModeKey, !_loadTheme());
      Get.changeTheme(theme);
    }
}