import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final String imageUrl;
  final String messageUrl;
  final String subject;
  final String description;

  Post({
    @required this.id,
    @required this.imageUrl,
    @required this.messageUrl,
    @required this.subject,
    @required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
      messageUrl: json['messageUrl'] as String,
      subject: json['subject'] as String,
      description: json['description'] as String,
    );
  }
}
