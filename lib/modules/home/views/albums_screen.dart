import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/home/controllers/albums_controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/albums_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class AlbumsScreen extends MVCWidget<AlbumsController, AlbumsViewModel> {
  AlbumsScreen({
    required AlbumsController controller,
    required AlbumsViewModel viewModel,
  }) : super(
    controller: controller,
    viewModel: viewModel,
  );

  factory AlbumsScreen.factory() {
    return AlbumsScreen(
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
            backgroundColor: Colors.red,
            appBar: AppBar(
              title: Text('Albums'),
            ),
          );
        });
  }
}