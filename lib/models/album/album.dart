import 'package:test_app_by_auramel/models/photo/photo.dart';
import 'package:test_app_by_auramel/models/model.dart';

class Album extends Model {
  final String title;
  final List<Photo> photosList;

  Album({
    required String id,
    required this.title,
    required this.photosList,
  }): super(id);

  factory Album.fromJson({
    required dynamic json,
    required List<Photo> photosList,
  }) {
    return Album(
      id: json['id'].toString(),
      title: json['title'].toString(),
      photosList: photosList,
    );
  }
}