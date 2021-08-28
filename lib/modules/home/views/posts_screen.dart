import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/home/controllers/posts_controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/posts_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class PostsScreen extends MVCWidget<PostsController, PostsViewModel> {
  PostsScreen({
    required PostsController controller,
    required PostsViewModel viewModel,
  }) : super(
    controller: controller,
    viewModel: viewModel,
  );

  factory PostsScreen.factory() {
    return PostsScreen(
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
              title: Text('Posts'),
            ),
          );
        });
  }
}