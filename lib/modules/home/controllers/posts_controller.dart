import 'package:get/get.dart';
import 'package:test_app_by_auramel/kernel/controller.dart';
import 'package:test_app_by_auramel/models/post/post.dart';
import 'package:test_app_by_auramel/modules/home/api/posts_api.dart';
import 'package:test_app_by_auramel/modules/home/view_models/posts_view_model.dart';

class PostsController extends Controller<PostsViewModel> {
  final PostsApi _api = Get.find();

  PostsController(PostsViewModel viewModel) : super(viewModel);

  @override
  void onInit() {
    viewModel.postsList.fetchCallback = _api.findAll;
    viewModel.postsList.fetchData();

    super.onInit();
  }

  Future<void> onCreateClicked() async {
    await Future.delayed(Duration(milliseconds: 200));

    Post post = await Get.toNamed('/home/posts/create');

    await _api.create(post);
    viewModel.postsList.fetchData();

  }
}