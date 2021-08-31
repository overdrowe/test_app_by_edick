import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/modules/post/view_models/post_form_view_model.dart';

class PostFormController extends Controller<PostFormViewModel> {
  PostFormController(PostFormViewModel viewModel) : super(viewModel);

  Future<void> onCloseScreen() async {
    Get.back();
  }
}