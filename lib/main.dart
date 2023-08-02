
import 'package:fluter_template/app/my_app.dart';
import 'package:fluter_template/app/my_app_controller.dart';
import 'package:fluter_template/core/data/repositories/shared_prefrence_repository.dart';
import 'package:fluter_template/core/services/connectivity_service.dart';
import 'package:fluter_template/core/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  Get.put(SharedPrefrenceRepository());
 // Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  // try {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );

  //   Get.put(NotificationService());
  // } catch (e) {
  //   print(e);
  // }

  runApp(const MyApp());
}
