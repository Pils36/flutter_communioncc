import 'dart:convert';

import 'package:communioncc/models/popular_sermons.dart';
import 'package:http/http.dart';

class HttpService {
  final String postUrl =
      "https://communioncc.org/api/v1/message/popularsermons";

  List<Post> posts = List<Post>();

  Future<List<Post>> getPosts() async {
    Response res = await get(postUrl);

    if (res.statusCode == 200) {
      var message = jsonDecode(res.body);

      var messages = List<Post>();

      for (var mymessages in message) {
        messages.add(Post.fromJson(mymessages));
      }

      // List<Post> posts =
      //     messages.map((dynamic item) => Post.fromJson(item)).toList();

      return messages;
    } else {
      throw "Can't get messages";
    }
  }
}
