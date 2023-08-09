import 'package:fluter_template/core/data/enums/message_type.dart';
import 'package:fluter_template/core/data/repositories/shared_prefrence_repository.dart';
import 'package:fluter_template/core/data/repositories/user_repository.dart';
import 'package:fluter_template/core/services/base_controller.dart';
import 'package:fluter_template/ui/shared/custom_widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewController extends BasController {
  TextEditingController nameController = TextEditingController();
  TextEditingController accesscodeController = TextEditingController();


  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  void login() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepository()
              .login(name: nameController.text, accessCode: nameController.text)
              .then((value) {
        value.fold((l) {
          isLoading.value = false;
          CustomToast.showMessage(
              messageType: MessageType.REJECTED, message: l);
        }, ((r) {
          SharedPrefrenceRepository().setTokenInfo(r);
          // Get.off((MainView(
          //   mealModel: MealModel(),
          // )
          // ));
        }));
      }));
    }
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
