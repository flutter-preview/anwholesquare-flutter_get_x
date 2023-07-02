import 'package:flutter/material.dart';
import 'package:flutter_get_x/ChangePassword.dart';
import 'package:flutter_get_x/Controller/AppController.dart';
import 'package:flutter_get_x/Controller/LoginController.dart';
import 'package:flutter_get_x/Controller/ThemeController.dart';
import 'package:flutter_get_x/LoginPage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  final ThemeController themeController = Get.find<ThemeController>();
  final LoginController loginController = Get.find<LoginController>();
  TextEditingController appNameController = TextEditingController(); 
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: Obx( () => 
           
           Stack(
             children: [

                Positioned(
                  left: 10,
                  top: 20,
                  child: GestureDetector(
                    onTap: () {
                      loginController.loadUser();
                      Get.to(ChangePassword());
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.account_box_outlined, size: 24, color: Colors.red),
                        SizedBox(width: 5,),
                        Text("My Account", style: TextStyle(fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ))
                ,
                
                Positioned(
                  right: 10,
                  top: 20,
                  child: GestureDetector(
                    onTap: () {
                      loginController.loadUser();
                      Get.snackbar("Flutter with GetX", "Logging out from ${loginController.emailRx.value}", snackPosition: SnackPosition.BOTTOM);
                      loginController.clearUser();
                      Get.to(LoginPage());

                    },
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app_rounded, size: 24, color: Colors.red,),
                        SizedBox(width: 5,),
                        Text("Log Out", style: TextStyle(fontWeight: FontWeight.w600),),
                          
                      ],
                    ),
                  ))
                ,
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(appController.messageName.value, textAlign: TextAlign.center, style: GoogleFonts.berkshireSwash(textStyle: const TextStyle(fontSize: 32 )) ),

                  ),
                  
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: appNameController,
                      textAlign: TextAlign.center,
                      maxLength: 30,
                      decoration: const InputDecoration(hintText: "Write a message that persists",),
                    )
                  ),
                  
                  const SizedBox(height: 10,),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: ()=> 
                        appController.setMessage(appNameController.text)
                      , child: const Text("Submit")),
                      const SizedBox(width: 10,),
                      ElevatedButton(onPressed: ()=> 
                        themeController.toggleTheme()
                      ,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black), child: const Text("Toggle Theme"),
                      ),
                    ],
                  )
                  
                ],
               ),
             ],
           )
        )
      ),
    );
  }
}