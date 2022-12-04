// ignore_for_file: use_key_in_widget_constructors, unused_field, must_be_immutable, prefer_final_fields, prefer_const_constructors, unused_element, unused_local_variable, curly_braces_in_flow_control_structures, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_application/route/route.dart';

import '../styles/style.dart';
import '../widgets/violetButton.dart';

class UserForm extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Rx<TextEditingController> _dobController = TextEditingController().obs;

  Rx<DateTime> selectedDate = DateTime.now().obs;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));

    if (picked != null && picked != selectedDate)
      _dobController.value.text =
          "${picked.day} - ${picked.month} - ${picked.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 70.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tell Us More About You.",
                style: AppStyle().signUpTextStyle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "We will not share your information \noutside this application.",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 30.h,
              ),
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: AppStyle().textFieldDecoration("Full Name"),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,
                  decoration: AppStyle().textFieldDecoration("Phone Number")),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.text,
                  decoration: AppStyle().textFieldDecoration("Address")),
              SizedBox(
                height: 20.h,
              ),
              Obx(
                () => TextFormField(
                  controller: _dobController.value,
                  readOnly: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                    ),
                    labelText: "Date of Birth",
                    suffixIcon: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Icon(Icons.calendar_month_rounded)),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              ToggleSwitch(
                activeBgColor: [Colors.red],
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Male', 'Female'],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              SizedBox(
                height: 50.h,
              ),
              VioletButton("Submit", () =>Get.toNamed(privacy)),
            ],
          ),
        ),
      ),
    );
  }
}
