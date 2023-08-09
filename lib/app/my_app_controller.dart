import 'package:fluter_template/core/data/enums/connectivity_status_enums.dart';
import 'package:fluter_template/core/services/base_controller.dart';
import 'package:fluter_template/core/utils/general_util.dart';



class MyAppController extends BasController {
  ConnectivityStatus connectivityStatus = ConnectivityStatus.ONLINE;

  set setConnectivityStatus(ConnectivityStatus value) {
    connectivityStatus = value;
  }

  void listenForConnectivityStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
    });
  }

  @override
  void onInit() {
    listenForConnectivityStatus();
    super.onInit();
  }
}
