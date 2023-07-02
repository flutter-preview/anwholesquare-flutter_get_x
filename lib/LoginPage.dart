import 'package:flutter/material.dart';
import 'package:flutter_get_x/Controller/AppController.dart';
import 'package:flutter_get_x/Controller/LoginController.dart';
import 'package:flutter_get_x/Controller/ThemeController.dart';
import 'package:flutter_get_x/HomePage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginController loginController = Get.find<LoginController>();
  LoginPage({super.key});

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();

  String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
  }

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
                  Text("Flutter with GetX", textAlign: TextAlign.center, style: GoogleFonts.berkshireSwash(textStyle: const TextStyle(fontSize: 32 )) ),
                  const SizedBox(height: 10,),
                  SizedBox( width: 300,
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
                        controller: emailCtr,
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          hintText: "Type Email"
                        ),
                      ),
                    )
                  ),
                  SizedBox( width: 300,
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: TextFormField(
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
                        if (validateEmail(emailCtr.text) == null && validatePass(passCtr.text) == null) {
                          loginController.setUser(emailCtr.text, passCtr.text);
                          Get.off(HomePage());
                        }else {
                          Get.snackbar("Wrong Input", "Please fill up the form with expected values", snackPosition: SnackPosition.BOTTOM);
                        }
                    }, 
                    child: const Text("Login with Password")
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