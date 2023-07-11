import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parshot_app/Utils/appcolors.dart';
import 'package:parshot_app/View/LogIn/loginview.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.to(()=> LoginView());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGround,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Welcome to",style: TextStyle(color: Colors.black,fontSize: 20),),
            Text("ParaShoot",style: TextStyle(color: Colors.black,fontSize: 20),),
          ],
        ),
      ),
    );
  }
}
