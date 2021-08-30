import 'package:test_app_by_auramel/models/model.dart';

class Post extends Model {
  final String userId;
  final String title;
  final String body;

  Post({
    required String id,
    required this.userId,
    required this.title,
    required this.body,
  }): super(id);

  factory Post.fromJson(dynamic json) {
    return Post(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      title: json['title'].toString(),
      body: json['body'].toString(),
    );
  }
}