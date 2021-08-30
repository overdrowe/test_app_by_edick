import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/models/photo/photo.dart';
import 'package:test_app_by_auramel/modules/album/view_models/album_view_model.dart';
import 'package:test_app_by_auramel/widgets/photo_gallery.dart';

class AlbumController extends Controller<AlbumViewModel> {
  AlbumController(AlbumViewModel viewModel) : super(viewModel);

  @override
  void onInit() {
    viewModel.album = Get.arguments;

    super.onInit();
  }

  Future<void> photoClicked({
    required List<Photo> galleryItems,
    required int initPage,
    required String tag,
  }) async {
    Get.to(
      PhotoGallery(
        galleryItems: galleryItems,
        initPage: initPage,
        tag: tag,
      ),
    );
  }
}