import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/models/messages.dart';
import 'package:communioncc/services/remote_services.dart';
import 'package:get/state_manager.dart';

class RecentSermonController extends GetxController {
  var isLoading = true.obs;

  var messages = List<Messages>().obs;

  String url = '${ApiClients().baseUrl}/message/recentsermons';

  @override
  void onInit() {
    fetchRecent();
    super.onInit();
  }

  void fetchRecent() async {
    try {
      isLoading(true);

      var thismessages = await RemoteServices.fetchSermons(url);

      if (thismessages != null) {
        messages.assignAll(thismessages);
      }
    } finally {
      isLoading(false);
    }
  }
}
