import 'package:hive/hive.dart';
import 'package:provider_start/core/models/post/post.dart';

part 'post_h.g.dart';

/// A Hive Database compatible Post Model
///   - @HiveField(unique) is necessary if you need the object to persist
@HiveType()
class PostH extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final int userId;

  PostH({
    this.id,
    this.title,
    this.description,
    this.userId,
  });

  factory PostH.fromPost(Post post) {
    return PostH(
      id: post.id,
      title: post.title,
      description: post.description,
      userId: post.userId,
    );
  }

  factory PostH.fromMap(Map<String, dynamic> map) {
    return PostH(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = description;
    map['userId'] = userId;
    return map;
  }
}
