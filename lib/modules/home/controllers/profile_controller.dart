import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/profile_view_model.dart';

class ProfileController extends Controller<ProfileViewModel> {
  ProfileController(ProfileViewModel viewModel) : super(viewModel);

  Future<void> tapButtonOnClicked() async {
    await Future.delayed(const Duration(milliseconds: 100));

    Get.generalDialog(
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text('Это ты хорошо придумал'),
                content: Text('Я сначала даже и не понял'),
              ),
            ),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation1, animation2) => Container(),
    );
  }
}