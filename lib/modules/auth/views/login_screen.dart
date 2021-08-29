import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            _buildCustomTextField(
              controller: viewModel.usernameController,
              label: 'Username',
            ),
            _buildCustomTextField(
              controller: viewModel.passwordController,
              label: 'Password',
              isPassword: true,
            ),
            _buildLoginButton(),
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

  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String label,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white.withOpacity(0.1),
          filled: true,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.white,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: InkWell(
            onTap: controller.onSubmitClicked,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: Colors.white,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 12,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 20,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}