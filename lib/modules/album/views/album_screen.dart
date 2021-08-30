import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/models/photo/photo.dart';
import 'package:test_app_by_auramel/modules/album/controllers/album_controller.dart';
import 'package:test_app_by_auramel/modules/album/view_models/album_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class AlbumScreen extends MVCWidget<AlbumController, AlbumViewModel> {
  AlbumScreen({
    required AlbumController controller,
    required AlbumViewModel viewModel,
  }): super(
    controller: controller,
    viewModel: viewModel,
  );

  factory AlbumScreen.factory() {
    return AlbumScreen(
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
            body: _buildBody(),
          );
        });
  }

  Widget _buildBody() {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      crossAxisCount: 2,
      shrinkWrap: false,
      children: viewModel.album.photosList.map((photo) => _buildImageItem(photo)).toList(),
    );
  }

  Widget _buildImageItem(Photo photo) {
    String heroTag = viewModel.albumId + photo.id;
    return InkWell(
      onTap: () => controller.photoClicked(
        galleryItems: viewModel.album.photosList,
        initPage: (int.parse(photo.id) - 1),
        tag: heroTag,
      ),
      child: Hero(
        tag: heroTag,
        child: CachedNetworkImage(imageUrl: photo.url),
      ),
    );
  }
}