import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeController extends GetxController {
    final _box = GetStorage();
    final themeModeKey = "isDarkMode";
    

    ThemeData darkTheme = ThemeData(
      primarySwatch: Colors.red,
      fontFamily: GoogleFonts.poppins().fontFamily,
      brightness: Brightness.dark
    );

    ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.red,
      fontFamily: GoogleFonts.poppins().fontFamily,
      brightness: Brightness.light
    );

    void getTheme ()  {
        bool isDark = (_box.read(themeModeKey) ?? false);
        debugPrint("isDark: $isDark");
        theme.value = isDark ? darkTheme : lightTheme;
        Get.changeTheme(theme.value);
    }
    
    dynamic get theme => (_box.read(themeModeKey) ?? false) ? darkTheme.obs : lightTheme.obs;

    void toggleTheme () async {
      bool isDark = !(_box.read(themeModeKey) ?? false);
      await _box.write(themeModeKey, isDark);
      debugPrint("isDark: $isDark");
      theme.value = isDark ? darkTheme : lightTheme;
      Get.changeTheme(theme.value);
    }
}