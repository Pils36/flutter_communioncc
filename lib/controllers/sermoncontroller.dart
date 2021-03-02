import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/models/messages.dart';
import 'package:communioncc/services/remote_services.dart';
// import 'package:communioncc/widgets/popular_sermons.dart';
import 'package:get/state_manager.dart';

class SermonController extends GetxController {
  var isLoading = true.obs;
  var messages = List<Messages>().obs;
  String url = '${ApiClients().baseUrl}/message/popularsermons';

  @override
  void onInit() {
    fetchSermons();
    super.onInit();
  }

  void fetchSermons() async {
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
