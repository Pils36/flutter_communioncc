import 'dart:convert';

import 'package:communioncc/models/popular_sermons.dart';
import 'package:http/http.dart';

class HttpService {
  final String postUrl =
      "https://communioncc.org/api/v1/message/popularsermons";

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;
    } else {
      throw "Can't get messages";
    }
  }
}
