import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Loader extends GetxService {
  static void startLoading() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                child: (GetPlatform.isAndroid)
                  ? const CircularProgressIndicator(strokeWidth: 2,)
                  : const CupertinoActivityIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  'Пожалуйста, подождите...',
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void stopLoading() {
    Get.back();
  }
}