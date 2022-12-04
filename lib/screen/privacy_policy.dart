import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tour_application/widgets/violetButton.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
              padding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 30.h, bottom: 50.h),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.green,
                  )),
                  SizedBox(
                    height: 20.h,
                  ),
                  VioletButton("Agree", () {})
                ],
              ))),
    );
  }
}