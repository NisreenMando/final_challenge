import 'package:fluter_template/app/my_app_controller.dart';
import 'package:fluter_template/core/data/enums/connectivity_status_enums.dart';
import 'package:fluter_template/core/data/enums/message_type.dart';
import 'package:fluter_template/core/data/repositories/shared_prefrence_repository.dart';
import 'package:fluter_template/core/services/location_service.dart';
import 'package:fluter_template/core/services/notifcations_srvice.dart';
import 'package:fluter_template/ui/shared/custom_widget/custom_toast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/connectivity_service.dart';

double get taxAmount => 0.18;
double get deliverAmount => 0.1;

//CartService get cartService => Get.find<CartService>();


LocationService get locationService => Get.find<LocationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();

bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    showNoConnectionMessage();
}

void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();

Future cLaunchUrl(Uri url) async {
  if (await launchUrl(
    url,
  )) {
    CustomToast.showMessage(
        message: 'Cant lunch url', messageType: MessageType.REJECTED);
  }
}