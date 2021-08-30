import 'package:test_app_by_auramel/kernel/list_view_model.dart';
import 'package:test_app_by_auramel/kernel/view_model.dart';
import 'package:test_app_by_auramel/models/post/post.dart';

class PostsViewModel extends ViewModel {
  ListViewModel<Post> postsList = ListViewModel<Post>();
}