// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, unrelated_type_equality_checks, prefer_const_constructors, avoid_print, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_application/styles/style.dart';
import '../../widgets/violetButton.dart';

class UserProfile extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;

  String? dob;
  String gender = "Male";
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate) {
      dob = "${selected.day} - ${selected.month} - ${selected.year}";
      _dobController.value.text = dob!;
    }
  }

  update(data) async {
    try {
      CollectionReference registerData =
          FirebaseFirestore.instance.collection("users-form-data");
      final user = FirebaseAuth.instance.currentUser!.email;
      registerData
          .doc(user)
          .update({
            "name": _nameController.text,
            "phone": _phoneController.text,
            "address": _addressController.text,
            "dob": _dobController.value.text,
            "gender": gender,
          })
          .then(
            (value) => Fluttertoast.showToast(
                msg: "Updated Successfully", backgroundColor: Colors.black87),
          )
          .then(
            (value) => Get.back(),
          );
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something is wrong", backgroundColor: Colors.black87);
    }
  }

  setUserData(data, context) {
    _nameController.text = data['name'];
    _phoneController.text = data['phone'].toString();
    _addressController.text = data['address'];
    _dobController.value.text = data['dob'];
    gender = data['gender'];
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormField(_nameController, TextInputType.name, 'Name'),
            SizedBox(
              height: 30.h,
            ),
            FormField(_phoneController, TextInputType.number, 'Phone Number'),
            SizedBox(
              height: 30.h,
            ),
            FormField(_addressController, TextInputType.text, 'Address'),
            SizedBox(
              height: 30.h,
            ),
            Obx(
              () => TextFormField(
                controller: _dobController.value,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    // borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: "date of birth",
                  hintStyle: TextStyle(
                    fontSize: 15.sp,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => _selectDate(context),
                    icon: Icon(Icons.calendar_month_rounded),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            ToggleSwitch(
              initialLabelIndex: gender == "Male" ? 0 : 1,
              totalSwitches: 2,
              labels: [
                'Male',
                'Female',
              ],
              onToggle: (index) {
                if (index == 0) {
                  gender = "Male";
                } else {
                  gender = "Female";
                }
                print('switched to: $index');
              },
            ),
            SizedBox(
              height: 70.h,
            ),
            VioletButton(
              "Update",
              () => update(data),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 30.sp, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users-form-data")
            .doc(FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return setUserData(data, context);
          }
        },
      ),
    );
  }
}

Widget FormField(controller, inputType, hint) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    decoration: AppStyle().textFieldDecoration(hint),
  );
}
