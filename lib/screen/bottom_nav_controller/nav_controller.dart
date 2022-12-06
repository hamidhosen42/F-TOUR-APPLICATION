// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:tour_application/const/app_string.dart';

import 'pages/nav_add.dart';
import 'pages/nav_favourite.dart';
import 'pages/nav_home.dart';

class BottomNavController extends StatefulWidget {
  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  RxInt _currentIndex = 1.obs;

  RxBool _drawer = false.obs;

  final _pages = [
    NavAdd(),
    NavHome(),
    NavFavourite(),
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
              title: Text(
                AppString.AppName,
                style: TextStyle(color: Colors.black),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 5.0,
              clipBehavior: Clip.antiAlias,
              child: Container(
                height: 90.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: BottomNavigationBar(
                      currentIndex: _currentIndex.value,
                      backgroundColor: Colors.white,
                      selectedItemColor: Colors.black,
                      onTap: (value) => _currentIndex.value = value,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.add_outlined), label: "Add"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined), label: ""),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.favorite_outlined),
                            label: "Favorite"),
                      ]),
                ),
              ),
            ),
            body: _pages[_currentIndex.value],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FloatingActionButton(
                backgroundColor:
                    _currentIndex == 1 ? Colors.grey : Colors.blueGrey,
                child: Icon(Icons.home),
                onPressed: () => setState(() {
                  _currentIndex.value = 1;
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}