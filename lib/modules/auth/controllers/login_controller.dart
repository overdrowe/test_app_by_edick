import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/kernel/exceptions.dart';
import 'package:test_app_by_auramel/kernel/loader.dart';
import 'package:test_app_by_auramel/modules/auth/view_models/login_view_model.dart';
import 'package:test_app_by_auramel/services/user_service.dart';

class LoginController extends Controller<LoginViewModel> {
  final UserService _userService = Get.find();

  LoginController(LoginViewModel viewModel) : super(viewModel);

  Future<void> onSubmitClicked() async {
    try {
      Loader.startLoading();

      await _userService.login(
        login: viewModel.username,
        password: viewModel.password,
      );
      Loader.stopLoading();

      Get.offNamed('/home');
    } on IncorrectLoginDataException catch (e) {
      Loader.stopLoading();
      Get.snackbar('Error!', e.message);
    }
  }
}