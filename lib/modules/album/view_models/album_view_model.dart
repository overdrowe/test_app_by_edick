import 'package:test_app_by_auramel/kernel/view_model.dart';
import 'package:test_app_by_auramel/models/album/album.dart';

class AlbumViewModel extends ViewModel {
  late Album album;
  String get albumId => album.id;
}