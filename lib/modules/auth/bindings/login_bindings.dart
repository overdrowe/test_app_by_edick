import 'package:get/get.dart';
import 'package:test_app_by_auramel/modules/auth/controllers/login_controller.dart';
import 'package:test_app_by_auramel/modules/auth/view_models/login_view_model.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
    Get.lazyPut<LoginViewModel>(() => LoginViewModel());
  }
}