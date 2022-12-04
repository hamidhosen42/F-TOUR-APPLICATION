// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/const/app_string.dart';
import 'package:tour_application/route/route.dart';
import 'package:tour_application/styles/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () => Get.toNamed(onboarding));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 3),()=>Get.toNamed(signUp));

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo/app-logo.png",
                height: 350.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(AppString.AppName, style: AppStyle().myTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}