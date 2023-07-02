import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
    
    var emailRx = "null".obs;
    var passRx = "null".obs;

    final isLoggedInKey = "isLoggedIn";
    final emailRxKey = "emailRx";
    final passRxKey = "passRx";

    final _box = GetStorage();
    bool get isLoggedIn => _box.read(isLoggedInKey) ?? false;
    
    void loadUser () {
        emailRx.value = _box.read(emailRxKey) ?? "null";
        passRx.value = _box.read(passRxKey) ?? "null";
    }
    
    void setUser(String email, String pass){
      emailRx.value = email;
      passRx.value = pass;
      _box.write(isLoggedInKey, true);
      _box.write(emailRxKey, email);
      _box.write(passRxKey, pass);
    }
    
    void clearUser () {
      emailRx.value = "null";
      passRx.value = "null";
      _box.write(emailRxKey, "null");
      _box.write(passRxKey, "null");
      _box.write(isLoggedInKey, false);
    }
}