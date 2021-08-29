import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/events.dart';
import 'package:test_app_by_auramel/modules/app/controllers/app_controller.dart';
import 'package:test_app_by_auramel/modules/app/view_models/app_view_model.dart';
import 'package:test_app_by_auramel/modules/app/views/app_layout.dart';
import 'package:test_app_by_auramel/services/user_service.dart';

Future<void> main() async {
  await initialServiceManager();

  runApp(Application.factory());
}

Future<void> initialServiceManager() async {
  // Events
  Get.lazyPut<AlbumsScreenSelectedEvent>(() => AlbumsScreenSelectedEvent());
  Get.lazyPut<PostsScreenSelectedEvent>(() => PostsScreenSelectedEvent());
  Get.lazyPut<ProfileScreenSelectedEvent>(() => ProfileScreenSelectedEvent());

  // Get.lazyPut<CreateOrderEvent>(() => CreateOrderEvent());

  //services
  Get.lazyPut<UserService>(() => UserService());

  // App
  Get.put(AppViewModel());
  Get.put(AppController(Get.find()));
}