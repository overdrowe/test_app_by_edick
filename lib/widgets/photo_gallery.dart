import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:test_app_by_auramel/models/photo/photo.dart';

class PhotoGallery extends StatelessWidget {
  final List<Photo> galleryItems;
  final int initPage;
  final String tag;

  const PhotoGallery({
    required this.galleryItems,
    required this.initPage,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    PageController controller = new PageController(initialPage: initPage % 50);
    return Hero(
      tag: tag,
      child: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        pageController: controller,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(galleryItems[index].url),
            initialScale: PhotoViewComputedScale.covered,
          );
        },
        itemCount: galleryItems.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
