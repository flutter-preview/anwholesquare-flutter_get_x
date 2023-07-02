import 'package:flutter/material.dart';
import 'package:flutter_get_x/Controller/AppController.dart';
import 'package:flutter_get_x/Controller/LoginController.dart';
import 'package:flutter_get_x/Controller/ThemeController.dart';
import 'package:flutter_get_x/HomePage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ChangePassword extends StatelessWidget {
  LoginController loginController = Get.find<LoginController>();
  ChangePassword({super.key});

  TextEditingController passCtr = TextEditingController();

  String? validatePass (String? value ) {
    if (value.toString().length < 6) {
      return "Password is less than 6 letters";
    }else {
      return null;
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Text("Flutter with GetX", textAlign: TextAlign.center, style: GoogleFonts.berkshireSwash(textStyle: const TextStyle(fontSize: 32)) ),
                  const SizedBox(height: 10,),
                  Obx(() => Text("${loginController.emailRx.value}", style: const TextStyle(fontSize: 14),)),
                  SizedBox( width: 250,
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: validatePass,
                        controller: passCtr,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Type Password"
                        ),
                      ),
                    )
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: (){
                        if (validatePass(passCtr.text) == null) {
                          loginController.setUser(loginController.emailRx.value, passCtr.text);
                          Get.off(HomePage());
                        }else {
                          Get.snackbar("Wrong Format of Password", "Please fill up the password with expected values", snackPosition: SnackPosition.BOTTOM);
                        }
                    }, 
                    child: const Text("Change Password")
                  )
              ],
            ),
          ),
        ),
      )
      ,
    );
  }
}