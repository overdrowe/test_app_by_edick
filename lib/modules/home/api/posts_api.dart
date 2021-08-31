import 'dart:convert';
import 'package:test_app_by_auramel/kernel/exceptions.dart';
import 'package:test_app_by_auramel/models/post/post.dart';
import 'package:get/get.dart';

class PostsApi extends GetConnect{

  Future<List<Post>> findAll() async {
    final String url = 'http://jsonplaceholder.typicode.com/posts/';
    final Response response = await get(url).timeout(Duration(seconds: 5));

    if (response.statusCode != 200) {
      throw ExceptionWithMessages('statusText: ${response.statusText}');
    }

    Iterable list = json.decode(response.bodyString.toString());
    List<Post> posts = List<Post>.from(list.map((model)=> Post.fromJson(model)));
    return posts;
  }

  Future<void> create(Post newPost) async {
    final String url = 'http://jsonplaceholder.typicode.com/posts/';
    final Response response = await post(url, {}).timeout(Duration(seconds: 5));;

    if (response.statusCode != 201) {
      throw ExceptionWithMessages('statusText: ${response.statusText}');
    }
  }
}