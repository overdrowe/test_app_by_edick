import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app_by_auramel/kernel/list_view_model.dart';
import 'package:test_app_by_auramel/models/album/album.dart';
import 'package:test_app_by_auramel/modules/home/controllers/albums_controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/albums_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class AlbumsScreen extends MVCWidget<AlbumsController, AlbumsViewModel> {
  AlbumsScreen({
    required AlbumsController controller,
    required AlbumsViewModel viewModel,
  }) : super(
    controller: controller,
    viewModel: viewModel,
  );

  factory AlbumsScreen.factory() {
    return AlbumsScreen(
      controller: Get.find(),
      viewModel: Get.find(),
    );
  }

  @override
  Widget build(_) {
    return GetBuilder(
        init: viewModel,
        global: false,
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Albums'),
            ),
            body: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    return GetBuilder(
      init: viewModel.albumsList,
      global: false,
      autoRemove: false,
      builder: (_) {
        return _buildListView(viewModel.albumsList);
      },
    );
  }

  Widget _buildListView(ListViewModel<Album> listViewModel) {

    if (listViewModel.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scrollbar(
      child: SmartRefresher(
        controller: listViewModel.refreshController,
        enablePullDown: true,
        enablePullUp: false,
        header: const ClassicHeader(),
        onRefresh: listViewModel.refreshData,
        child: GridView.count(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 2,
          shrinkWrap: false,
          children: listViewModel.items.map((album) => _buildAlbumPreview(album)).toList(),
        ),
      ),
    );
  }

  Widget _buildAlbumPreview(Album album) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () => controller.albumClicked(album),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              _buildImagePreviewItem(
                heroTag: album.id + album.photosList[0].id,
                photoUrl: album.photosList[0].thumbnailUrl.toString(),
              ),
              _buildImagePreviewItem(
                heroTag: album.id + album.photosList[1].id,
                photoUrl: album.photosList[1].thumbnailUrl.toString(),
              ),
              _buildImagePreviewItem(
                heroTag: album.id + album.photosList[2].id,
                photoUrl: album.photosList[2].thumbnailUrl.toString(),
              ),
              _buildImagePreviewItem(
                heroTag: album.id + album.photosList[3].id,
                photoUrl: album.photosList[3].thumbnailUrl.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreviewItem({
    required String heroTag,
    required String photoUrl,
  }) {
    return Hero(
      tag: heroTag,
      child: Image.network(photoUrl),
    );
  }
}