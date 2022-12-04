// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, unused_field, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tour_application/const/app_colors.dart';

class VioletButton extends StatelessWidget {

  late String title;
  final Function onAction;

  VioletButton(this.title, this.onAction);

  RxBool _value = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      InkWell(
        onTap: () {
          _value.value = true;
          onAction();
        },
        child: Container(
            height: 60 .h,
            decoration: BoxDecoration(
                color: AppColors.violetColor,
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: _value == false
                ? Center(
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Please Wait",
                        style: TextStyle(
                            fontSize: 22.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Transform.scale(scale: .60,
                        child: CircularProgressIndicator(
                            color: Colors.white,
                            backgroundColor: AppColors.violetColor),
                      ),
                    ],
                  )),
      ),
    );
  }
}