


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_prectical/core/constants/app_images.dart';
import 'package:interview_prectical/features/splash/presentation/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
   SplashPage({super.key});

  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //backgroundColor: Colors.red,
      body: Container(
        color: Colors.orange.shade100,
        width: MediaQuery.sizeOf(context).width,
        height: double.infinity,
        child: Image(image: AssetImage(AppImage.splash),fit: BoxFit.cover,),
      ),
    );
  }
}
