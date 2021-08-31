import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/auth/controllers/login_controller.dart';
import 'package:test_app_by_auramel/modules/auth/view_models/login_view_model.dart';
import 'package:test_app_by_auramel/widgets/custom_button.dart';
import 'package:test_app_by_auramel/widgets/custom_text_field.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetBuilder(
        init: viewModel,
        global: false,
        builder: (_){
      return Scaffold(
        backgroundColor: Colors.green,
        body: _buildBody(),
      );
    });
  }

  Widget _buildBody() {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(flex: 3),
            _buildLogo(),
            Spacer(flex: 1),
            CustomTestField(
              controller: viewModel.usernameController,
              label: 'Username',
            ),
            CustomTestField(
              controller: viewModel.passwordController,
              label: 'Password',
              isPassword: true,
            ),
            CustomButton(
              title: 'Sign in',
              onTap: controller.onSubmitClicked,
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: SvgPicture.asset(
        'assets/logo/logo.svg',
        width: 128,
        color: Colors.white.withOpacity(0.85),
      ),
    );
  }
}