import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/post/controllers/post_form_controller.dart';
import 'package:test_app_by_auramel/modules/post/view_models/post_form_view_model.dart';
import 'package:test_app_by_auramel/widgets/custom_button.dart';
import 'package:test_app_by_auramel/widgets/custom_text_field.dart';
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
            backgroundColor: Colors.green,
            appBar: AppBar(
              title: Text('Post creating'),
              elevation: 0,
            ),
            body: _buildBody(),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTestField(
          controller: viewModel.titleController,
          label: 'Title',
        ),
        CustomTestField(
          controller: viewModel.bodyController,
          label: 'Body',
        ),
        CustomButton(
          title: 'Create',
          onTap: () => controller.onCloseScreen(),
        )
      ],
    );
  }
}