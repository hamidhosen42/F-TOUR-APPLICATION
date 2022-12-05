// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bottom_nav_controller/nav_controller.dart';
import 'drawer_screen.dart';

class MainHomeScreen extends StatelessWidget {


  Future _exitDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are u sure to close this app?"),
            content: Row(
              children: [
                ElevatedButton(
                  onPressed: ()=>Get.back(),
                  child: Text("No"),
                ),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                  onPressed: ()=>SystemNavigator.pop(),
                  child: Text("Yes"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        _exitDialog(context);
        return Future.value(false);
      } ,
      child: Scaffold(
        body: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerScreen(),
            BottomNavController(),
          ],
        ),
      ),
    );
  }
}