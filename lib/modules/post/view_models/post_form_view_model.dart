import 'package:flutter/cupertino.dart';
import 'package:test_app_by_auramel/kernel/view_model.dart';
import 'package:test_app_by_auramel/models/post/post.dart';

class PostFormViewModel extends ViewModel {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  late Post post;
}