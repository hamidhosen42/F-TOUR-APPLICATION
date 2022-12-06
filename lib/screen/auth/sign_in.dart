// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, must_be_immutable

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/const/app_colors.dart';
import 'package:tour_application/route/route.dart';
import 'package:tour_application/styles/style.dart';

import '../../back_end/auth.dart';
import '../../widgets/violetButton.dart';
import 'phone_auth.dart';

class SignIn extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 80.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login\nTo Your Account",
                style: AppStyle().signUpTextStyle,
              ),
              // SizedBox(
              //   height: 12.h,
              // ),
              // Text(
              //   "Create your account and start your \njourney",
              //   style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w300),
              // ),
              SizedBox(
                height: 70.h,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: AppStyle().textFieldDecoration("Email"),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: AppStyle().textFieldDecoration("Password")),
              SizedBox(
                height: 40.h,
              ),
              VioletButton("Login", () {
                Auth().login(
                      _emailController.text, _passwordController.text, context);
              }),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Text(
                  "--OR--",
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/google.png",
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset("assets/icons/facebook.png")),
                      IconButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (_) => PhoneAuth()));
                      },
                      icon: Icon(Icons.mobile_screen_share_rounded,size: 40.sp,)),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                      text: "Don’t have registered yet?",
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      children: [
                        TextSpan(
                            text: " Sign Up",
                            style: TextStyle(
                                fontSize: 20.sp,
                                color: AppColors.violetColor,
                                fontWeight: FontWeight.w600),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(signUp);
                              })
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}