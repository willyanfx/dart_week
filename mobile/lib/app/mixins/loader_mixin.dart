import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoaderMixin {
  showLoader() {
    Get.dialog(Container(
        width: 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[CircularProgressIndicator()],
        )));
  }

  hideLoader() {
    Get.back();
  }
}
