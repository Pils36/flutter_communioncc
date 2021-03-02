import 'dart:convert';

import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/models/messages.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static Future<List<Messages>> fetchSermons(String url) async {
    var response = await http.get(url, headers: ApiClients().headers);

    var messages = List<Messages>();

    if (response.statusCode == 200) {
      var jsonString = json.decode(response.body)['data'];

      for (var messageJson in jsonString) {
        messages.add(Messages.fromJson(messageJson));
      }

      return messages;
    } else {
      return null;
    }
  }
}
