import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/models/messages.dart';
import 'package:communioncc/services/remote_services.dart';

class Api {
  Future<List<Messages>> fetchPopularSermon() async {
    var url = "${ApiClients().baseUrl}/message/popularsermons";

    var thismessages = RemoteServices.fetchSermons(url);

    return thismessages;
  }
}
