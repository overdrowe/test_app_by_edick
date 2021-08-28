import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/auth/controllers/login_controller.dart';
import 'package:test_app_by_auramel/modules/auth/view_models/login_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class LoginScreen extends MVCWidget<LoginController, LoginViewModel> {
  LoginScreen({
    required LoginController controller,
    required LoginViewModel viewModel,
  }): super(
    controller: controller,
    viewModel: viewModel,
  );

  factory LoginScreen.factory() {
    return LoginScreen(
      controller: Get.find(),
      viewModel:  Get.find(),
    );
  }

  @override
  Widget build(_) {
    return GetBuilder(
        init: viewModel,
        global: false,
        builder: (_){
      return Scaffold();
    });
  }


}