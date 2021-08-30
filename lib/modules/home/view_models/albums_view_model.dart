import 'package:test_app_by_auramel/kernel/list_view_model.dart';
import 'package:test_app_by_auramel/kernel/view_model.dart';
import 'package:test_app_by_auramel/models/album/album.dart';

class AlbumsViewModel extends ViewModel {
  ListViewModel<Album> albumsList = ListViewModel<Album>();
}