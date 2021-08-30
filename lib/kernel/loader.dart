import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Loader extends GetxService {
  static void startLoading() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                child: (GetPlatform.isAndroid)
                  ? const CircularProgressIndicator(strokeWidth: 2, color: Colors.green,)
                  : const CupertinoActivityIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Text(
                  'Please wait...',
                  style: TextStyle(
                    fontSize: 18
                  ),
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