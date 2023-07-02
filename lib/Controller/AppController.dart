// ignore_for_file: file_names
import 'package:get/get.dart';

class AppController extends GetxController {
  var messageName = "Welcome to GetX".obs;
  
  void setMessage (String messageName1) {
    messageName.value = messageName1;
  }
}