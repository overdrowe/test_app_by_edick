import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/post/controllers/post_form_controller.dart';
import 'package:test_app_by_auramel/modules/post/view_models/post_form_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class PostFormScreen extends MVCWidget<PostFormController, PostFormViewModel> {
  PostFormScreen({
    required PostFormController controller,
    required PostFormViewModel viewModel,
  }): super(
    controller: controller,
    viewModel: viewModel,
  );

  factory PostFormScreen.factory() {
    return PostFormScreen(
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
        return WillPopScope(
          onWillPop: () async {
            await controller.onCloseScreen();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text('Post creating'),
            ),

            body: _buildBody(),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return Column(
      children: [

      ],
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
}