// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, unrelated_type_equality_checks
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tour_application/const/app_colors.dart';
import 'package:tour_application/route/route.dart';
import 'package:tour_application/styles/style.dart';

class OnboardingScreen extends StatelessWidget {
  List<String> _lottieFiles = [
    "assets/files/welcome.json",
    "assets/files/categories.json",
    "assets/files/support.json"
  ];

  List<String> _title = ["Welcome", "Categories", "Support"];

  List<String> _description = [
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae",
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae"
  ];

  RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25.w),
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  flex: 2,
                  child: Container(
                    child: Lottie.asset(_lottieFiles[_currentIndex.toInt()]),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: BoxDecoration(
                        color: AppColors.scaffoldColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(4.0, 4.0),
                              blurRadius: 10,
                              spreadRadius: 1.0),
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text("${_title[_currentIndex.toInt()]}",
                              style: AppStyle().myTextStyle),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Obx(
                          () => Text(
                            "${_description[_currentIndex.toInt()]}",
                            style: TextStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => DotsIndicator(
                                dotsCount: _lottieFiles.length,
                                position: _currentIndex.toDouble(),
                                decorator: DotsDecorator(
                                  color: Colors.black87, // Inactive color
                                  activeColor: Colors.redAccent,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (_currentIndex==_title.length-1) {
                                  Get.toNamed(signUp);
                                } else {
                                  _currentIndex = _currentIndex + 1;
                                }
                              },
                              child: Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: AppColors.scaffoldColor,
                                    // shape: BoxShape.circle,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(4.0, 4.0),
                                          blurRadius: 10,
                                          spreadRadius: 1.0),
                                      BoxShadow(
                                          color: Colors.white,
                                          offset: Offset(-4.0, -4.0),
                                          blurRadius: 5.0,
                                          spreadRadius: 1.0)
                                    ]),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}