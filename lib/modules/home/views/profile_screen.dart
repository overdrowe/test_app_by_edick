import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/home/controllers/profile_controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/profile_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class ProfileScreen extends MVCWidget<ProfileController, ProfileViewModel> {
  ProfileScreen({
    required ProfileController controller,
    required ProfileViewModel viewModel,
  }) : super(
    controller: controller,
    viewModel: viewModel,
  );

  factory ProfileScreen.factory() {
    return ProfileScreen(
      controller: Get.find(),
      viewModel: Get.find(),
    );
  }

  @override
  Widget build(_) {
    return GetBuilder(
        init: viewModel,
        global: false,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
            ),
          );
        });
  }
}