// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_field, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Privacy extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  RxBool _loaded = false.obs;

  showPrivacyPolicy(data) {
    return SfPdfViewer.network(
      data['url'],
      onDocumentLoaded: (PdfDocumentLoadedDetails details) {
        _loaded.value = true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Privacy"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("privacy")
            .doc("00001111")
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
            return showPrivacyPolicy(data);
          }
        },
      ),
    );
  }
}