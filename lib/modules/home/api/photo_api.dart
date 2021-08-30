import 'dart:convert';
import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/exceptions.dart';
import 'package:test_app_by_auramel/models/photo/photo.dart';

class PhotoApi extends GetConnect {

  Future<List<Photo>> findAll() async {
    final String url = 'http://jsonplaceholder.typicode.com/photos/';
    final Response response = await get(url);

    if (response.statusCode != 200) {
      throw ExceptionWithMessages('statusText: ${response.statusText}');
    }

    Iterable list = json.decode(response.bodyString.toString());
    List<Photo> photos = List<Photo>.from(list.map((model)=> Photo.fromJson(model)));

    return photos;
  }
}