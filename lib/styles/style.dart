// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/app_colors.dart';

class AppStyle {
  TextStyle myTextStyle =
      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600);
  TextStyle signUpTextStyle = TextStyle(
      fontSize: 40.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.violetColor);

  InputDecoration textFieldDecoration(String hint) => InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          // borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        labelText: hint,
        labelStyle: TextStyle(fontSize: 20,color: Colors.grey),
      );
}