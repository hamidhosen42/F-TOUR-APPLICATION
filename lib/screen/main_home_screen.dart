// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

import '../const/app_string.dart';
import '../route/route.dart';
import '../widgets/drawer_item.dart';
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
                  onPressed: () => Get.back(),
                  child: Text("No"),
                ),
                SizedBox(
                  width: 20.w,
                ),
                ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
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
      onWillPop: () {
        _exitDialog(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.AppName,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(profileScreen);
                },
                icon: Icon(CupertinoIcons.person_alt_circle))
          ],
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black, size: 40.sp),
        ),
        body: Stack(
          children: [
            // DrawerScreen(),
            BottomNavController(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  accountName: Text("Md.Hamid Hosen",
                      style: TextStyle(
                        fontSize: 20,
                        // fontFamily: "Cursive",
                        fontWeight: FontWeight.bold,
                      )),
                  accountEmail: Text("sdfsd"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/image/img-1.jpg"),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.support_outlined),
                title: drawerItem(
                  "Support",
                  () => Get.toNamed(supportScreen),
                ),
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: drawerItem(
                  "Privacy",
                  () => Get.toNamed(privacyScreen),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.question_circle),
                title: drawerItem(
                  "FAQ",
                  () => Get.toNamed(faqScreen),
                ),
              ),
              ListTile(
                leading: Icon(Icons.rate_review_sharp),
                title: drawerItem(
                  "Rate US",
                  () => LaunchReview.launch(
                    androidAppId: "com.example.shelter",
                    iOSAppId: "585027354",
                  ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.person),
                title: drawerItem(
                  "How to use",
                  () => Get.toNamed(howToUseScreen),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.settings),
                title: drawerItem(
                  "Settings",
                  () => Get.toNamed(settingsScreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
