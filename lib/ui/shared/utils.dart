import 'package:bot_toast/bot_toast.dart';
import 'package:fluter_template/app/my_app_controller.dart';
import 'package:fluter_template/core/data/enums/connectivity_status_enums.dart';
import 'package:fluter_template/core/data/enums/message_type.dart';
import 'package:fluter_template/core/data/repositories/shared_prefrence_repository.dart';
import 'package:fluter_template/core/services/connectivity_service.dart';
import 'package:fluter_template/core/services/location_service.dart';
import 'package:fluter_template/ui/shared/colors.dart';
import 'package:fluter_template/ui/shared/custom_widget/custom_toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/services/notifcations_srvice.dart';



// ignore: non_constant_identifier_names
double ScreenWidth(double percent) {
  return Get.size.width / percent;
}

// ignore: non_constant_identifier_names
double ScreenHeight(double percent) {
  return Get.size.height / percent;
}

void CustomLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.amber200, borderRadius: BorderRadius.circular(15)),
        width: ScreenWidth(4),
        height: ScreenHeight(4),
        child: SpinKitCircle(
          color: AppColors.blue,
          size: ScreenWidth(8),
        ),
      );
    });





