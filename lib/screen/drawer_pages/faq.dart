// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable, unused_field, prefer_final_fields, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../widgets/violetButton.dart';

class FAQ extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "FAQ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 5.h),
          child: Column(
            children: [
              Expanded(
                child: SfPdfViewer.network(
                  'https://firebasestorage.googleapis.com/v0/b/tour-application-57625.appspot.com/o/privacy%20policy%2Fprivacy-policy.pdf?alt=media&token=047c5c12-206f-47eb-817b-8809286b204f',
                  onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                    _loaded.value = true;
                  },
                ),
              ),
            ],
          )),
    );
  }
}