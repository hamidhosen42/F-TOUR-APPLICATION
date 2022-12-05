// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

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
        labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
      );
  progressDialog(context) => showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Text("Processing"),
              ],
            ),
          ),
        ),
      );
}