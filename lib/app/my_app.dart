import 'package:bot_toast/bot_toast.dart';
import 'package:fluter_template/core/data/enums/connectivity_status_enums.dart';
import 'package:fluter_template/core/data/repositories/shared_prefrence_repository.dart';
import 'package:fluter_template/core/translations/app_translation.dart';
import 'package:fluter_template/core/utils/general_util.dart';
import 'package:fluter_template/ui/shared/utils.dart';
import 'package:fluter_template/ui/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        initialData: ConnectivityStatus.ONLINE,
        create: (context) =>
            connectivityService.connectivityStatusController.stream,
        child: GetMaterialApp(
            title: 'Flutter Demo',
            builder: BotToastInit(), //1. call BotToastInit
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            fallbackLocale: getLocal(),
            locale: getLocal(),
            translations: AppTranslation(),
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const LoginView()));
  }
}

Locale getLocal() {
  if (SharedPrefrenceRepository().getAppLang() == 'ar') {
    return const Locale('ar', 'SA');
  } else {
    return const Locale('en', 'US');
  }
}
