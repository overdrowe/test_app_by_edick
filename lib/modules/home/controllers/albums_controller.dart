import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/models/album/album.dart';
import 'package:test_app_by_auramel/modules/home/api/albums_api.dart';
import 'package:test_app_by_auramel/modules/home/view_models/albums_view_model.dart';

class AlbumsController extends Controller<AlbumsViewModel> {
  final AlbumsApi _api = Get.find();

  AlbumsController(AlbumsViewModel viewModel) : super(viewModel);

  @override
  void onInit() {
    viewModel.albumsList.fetchCallback = _api.findAll;
    viewModel.albumsList.fetchData();

    super.onInit();
  }

  Future<void> albumClicked(Album album) async {
    Get.toNamed('/home/albums/album', arguments: album);
  }
}