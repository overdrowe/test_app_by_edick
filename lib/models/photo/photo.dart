import 'package:test_app_by_auramel/models/model.dart';

class Photo extends Model {
  final String albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required String id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  }): super(id);

  factory Photo.fromJson(dynamic json) {
    return Photo(
      id: json['id'].toString(),
      albumId: json['albumId'].toString(),
      title: json['title'].toString(),
      url: json['url'].toString(),
      thumbnailUrl: json['thumbnailUrl'].toString(),
    );
  }
}