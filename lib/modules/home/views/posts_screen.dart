import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_app_by_auramel/kernel/list_view_model.dart';
import 'package:test_app_by_auramel/models/post/post.dart';
import 'package:test_app_by_auramel/modules/home/controllers/posts_controller.dart';
import 'package:test_app_by_auramel/modules/home/view_models/posts_view_model.dart';
import 'package:test_app_by_auramel/widgets/mvc_widget.dart';

class PostsScreen extends MVCWidget<PostsController, PostsViewModel> {
  PostsScreen({
    required PostsController controller,
    required PostsViewModel viewModel,
  }) : super(
    controller: controller,
    viewModel: viewModel,
  );

  factory PostsScreen.factory() {
    return PostsScreen(
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
          appBar: AppBar(
            title: Text('Posts'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: controller.onCreateClicked,
          ),
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return GetBuilder(
      init: viewModel.postsList,
      global: false,
      autoRemove: false,
      builder: (_) {
        return _buildListView(viewModel.postsList);
      },
    );
  }

  Widget _buildListView(ListViewModel<Post> listViewModel) {

    if (listViewModel.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scrollbar(
      child: SmartRefresher(
        controller: listViewModel.refreshController,
        enablePullDown: true,
        enablePullUp: false,
        header: const ClassicHeader(),
        onRefresh: listViewModel.refreshData,
        child: ListView.builder(
          itemBuilder: (context, index) => _buildPost(listViewModel.items[index]),
          itemCount: listViewModel.items.length,
        ),
      ),
    );
  }

  Widget _buildPost(Post post) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.3)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(post.id.toString()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  post.title,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}