import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/post/controllers/post_form_controller.dart';
import 'package:test_app_by_auramel/modules/post/view_models/post_form_view_model.dart';

class PostFormBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostFormController>(() => PostFormController(Get.find()));
    Get.lazyPut<PostFormViewModel>(() => PostFormViewModel());
  }

}