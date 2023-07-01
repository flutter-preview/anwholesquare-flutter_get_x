import 'package:flutter/material.dart';
import 'package:flutter_get_x/Controller/AppController.dart';
import 'package:flutter_get_x/Controller/ThemeController.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final AppController appController = Get.find<AppController>();
  final ThemeController themeController = Get.find<ThemeController>();
  TextEditingController appNameController = TextEditingController(); 
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        
        child: Obx( () => 
           
           Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(appController.appName.value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
              ),
              
              SizedBox(
                width: 200,
                child: TextField(
                  controller: appNameController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Write App Name",),
                )
              ),
              
              const SizedBox(height: 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: ()=> 
                    appController.setAppName(appNameController.text)
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
           ))
        )
      ),
    );
  }
}