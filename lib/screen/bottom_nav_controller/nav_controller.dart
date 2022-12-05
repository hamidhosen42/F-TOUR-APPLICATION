// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:tour_application/const/app_string.dart';

import 'pages/nav_home.dart';

class BottomNavController extends StatelessWidget {
  RxInt _currentIndex = 0.obs;
  RxBool _drawer = false.obs;

  final _pages = [
   NavHome(),
  //  NavAdd(),
  //  NavFavourite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 400),
        top: _drawer.value == false ? 0 : 100.h,
        bottom: _drawer.value == false ? 0 : 100.h,
        left: _drawer.value == false ? 0 : 200.w,
        right: _drawer.value == false ? 0 : -100.w,
        child: Container(
          decoration: BoxDecoration(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              leading: _drawer.value == false
                  ? IconButton(
                      onPressed: () {
                        _drawer.value = true;
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        _drawer.value = false;
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
              title: Text(AppString.AppName),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) => _currentIndex.value = value,
              currentIndex: _currentIndex.value,
              // ignore: prefer_const_literals_to_create_immutables
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_outlined), label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outlined), label: "Favorite"),
              ],
            ),
            body: _pages[_currentIndex.value],
          ),
        ),
      ),
    );
  }
}