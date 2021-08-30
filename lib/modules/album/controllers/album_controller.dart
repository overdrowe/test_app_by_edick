import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/modules/album/view_models/album_view_model.dart';

class AlbumController extends Controller<AlbumViewModel> {
  AlbumController(AlbumViewModel viewModel) : super(viewModel);

  @override
  void onInit() {
    viewModel.album = Get.arguments;

    super.onInit();
  }
}