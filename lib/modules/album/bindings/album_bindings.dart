import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/album/controllers/album_controller.dart';
import 'package:test_app_by_auramel/modules/album/view_models/album_view_model.dart';

class AlbumBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlbumController>(() => AlbumController(Get.find()));
    Get.lazyPut<AlbumViewModel>(() => AlbumViewModel());
  }
}