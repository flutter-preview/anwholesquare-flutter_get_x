// ignore_for_file: file_names
import 'package:get/get.dart';

class AppController extends GetxController {
  var appName = "GetX Flutter".obs;
  
  void setAppName (String _appName) {
    appName.value = _appName;
  }
}