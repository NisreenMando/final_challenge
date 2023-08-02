
import 'package:fluter_template/core/data/repositories/shared_prefrence_repository.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // Future.delayed(const Duration(seconds: 5)).then((value) {
    //   if (SharedPrefrenceRepository().getFirstLunch() &&
    //       SharedPrefrenceRepository().getTokenInfo() == null) {
    //     //? to =push//off=replacment//
    //     Get.off(() => IntroView());
    //   } else {
    //     Get.off(() => SharedPrefrenceRepository().isLogedIn
    //         ? const  LandingView()
    //         : const LandingView());
    //     SharedPrefrenceRepository().setFirstLunch(false);
    //   }
    // });
    super.onInit();
  }
}

// import 'package:easy_shopping/core/data/repositories/shared_prefrence_repository.dart';
// import 'package:easy_shopping/ui/views/intro_view/intro_view.dart';
// import 'package:easy_shopping/ui/views/landing_view/landing_view.dart';
// import 'package:easy_shopping/ui/views/main_view/main_view.dart';
// import 'package:get/get.dart';

// class SplashScreenController extends GetxController {
//   @override
//   void onInit() {
//     Future.delayed(const Duration(seconds: 2)).then((value) {
//       if (SharedPrefrenceRepository().getFirstLunch()) {
//         //? to =push//off=replacment//
//         Get.off(const IntroView());
//       } else {
//         Get.off(SharedPrefrenceRepository().isLogedIn
//             ? const MainView()
//             : const LandingView());
//         SharedPrefrenceRepository().setFirstLunch(false);
//       }
//     });
//     super.onInit();
//   }
// }
