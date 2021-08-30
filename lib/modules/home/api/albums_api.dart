import 'dart:convert';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/exceptions.dart';
import 'package:test_app_by_auramel/models/album/album.dart';
import 'package:test_app_by_auramel/models/photo/photo.dart';
import 'package:test_app_by_auramel/modules/home/api/photo_api.dart';

class AlbumsApi extends GetConnect {
  final PhotoApi _photoApi = Get.find();

  Future<List<Album>> findAll() async {
    final String url = 'http://jsonplaceholder.typicode.com/albums/';
    final Response response = await get(url);

    if (response.statusCode != 200) {
      throw ExceptionWithMessages('statusText: ${response.statusText}');
    }

    List<Photo> photos = await _photoApi.findAll();

    Iterable list = json.decode(response.bodyString.toString());
    List<Album> albums = List<Album>.from(
      list.map(
        (model) => Album.fromJson(
          json: model,
          photosList: photos.where((element) => (element.albumId.toString() == model['id'].toString())).toList(),
        ),
      ),
    );
    return albums;
  }
}