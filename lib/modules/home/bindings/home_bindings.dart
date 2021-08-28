import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/home/controllers/albums_controller.dart';
import 'package:test_app_by_auramel/modules/home/controllers/home_controller.dart';
import 'package:test_app_by_auramel/modules/home/controllers/posts_controller.dart';
import 'package:test_app_by_auramel/modules/home/controllers/profile_controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/albums_view_model.dart';
import 'package:test_app_by_auramel/modules/home/view_models/home_view_model.dart';
import 'package:test_app_by_auramel/modules/home/view_models/posts_view_model.dart';
import 'package:test_app_by_auramel/modules/home/view_models/profile_view_model.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<HomeViewModel>(() => HomeViewModel());

    Get.lazyPut<AlbumsController>(() => AlbumsController(Get.find()));
    Get.lazyPut<AlbumsViewModel>(() => AlbumsViewModel());

    Get.lazyPut<PostsController>(() => PostsController(Get.find()));
    Get.lazyPut<PostsViewModel>(() => PostsViewModel());

    Get.lazyPut<ProfileController>(() => ProfileController(Get.find()));
    Get.lazyPut<ProfileViewModel>(() => ProfileViewModel());
  }
}