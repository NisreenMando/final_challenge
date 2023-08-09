import 'package:fluter_template/core/utils/string_util.dart';
import 'package:fluter_template/ui/shared/colors.dart';
import 'package:fluter_template/ui/shared/custom_widget/custom_button.dart';
import 'package:fluter_template/ui/shared/custom_widget/custom_text.dart';
import 'package:fluter_template/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:fluter_template/ui/shared/utils.dart';
import 'package:fluter_template/ui/views/home/home_view.dart';
import 'package:fluter_template/ui/views/login_view/login_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginViewController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenHeight(10), bottom: ScreenHeight(20)),
                child: const CustomText(
                  text: 'تسجيل الدخول',
                  color: AppColors.purple100,
                  fontSize: 15,
                ),
              ),
              SvgPicture.asset('assets/images/Login.svg'),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: ScreenWidth(1.8),
                ),
                child: const CustomText(
                  text: 'اسم المستخدم',
                  color: AppColors.purple100,
                  fontSize: 17,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenWidth(25),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomTextFormField(
                    style: const TextStyle(height: 1.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(ScreenWidth(30)),
                        borderSide: BorderSide.none),
                    keyboardType: TextInputType.text,
                    labelStyle: TextStyle(
                      color: AppColors.purple300.withOpacity(0.5),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.red200)),
                    backgroundColor: AppColors.colorBlue2.withOpacity(0.2),
                    controller: controller.accesscodeController,
                    borderRaduis: ScreenWidth(25),
                    labeltext: 'اسم المستخدم',
                    svgPicture: SvgPicture.asset(
                      'assets/images/ic_profile.svg',
                      color: AppColors.purple300.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value?.isNotEmpty ?? false) {
                      } else {
                        return 'الإسم_مطلوب';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  end: ScreenWidth(1.8),
                ),
                child: const CustomText(
                  text: 'رمز الدخول',
                  color: AppColors.purple100,
                  fontSize: 17,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenWidth(25),
                ),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomTextFormField(
                    style: const TextStyle(height: 1.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(ScreenWidth(30)),
                        borderSide: BorderSide.none),
                    keyboardType: TextInputType.text,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.red200)),
                    backgroundColor: AppColors.colorBlue2.withOpacity(0.2),
                    controller: controller.accesscodeController,
                    borderRaduis: ScreenWidth(25),
                    labeltext: 'رمز الدخول',
                    labelStyle:
                        TextStyle(color: AppColors.purple300.withOpacity(0.5)),
                    svgPicture: SvgPicture.asset(
                      'assets/images/ic_key.svg',
                      // width: 10,
                      // height: 10,
                      color: AppColors.purple200,
                    ),
                    validator: (value) {
                      if (value?.isNotEmpty ?? false) {
                      } else {
                        return 'رمز الدخول_مطلوب';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: ScreenHeight(25),
              ),
              Obx(() {
                return controller.isLoading.value
                    ? const SpinKitThreeBounce(
                        color: AppColors.orange400,
                      )
                    : CustomButton(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenWidth(25),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenHeight(25),
                            vertical: ScreenHeight(100)),
                        title: 'تسجيل الدخول',
                        borderRadius: BorderRadius.circular(ScreenWidth(30)),
                        backgroundColor: AppColors.purple100,
                        onPressed: () {
                          controller.login();
                          Get.to(const HomeView());
                        },
                      );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'ليس لديك حساب؟',
                    color: AppColors.purple100,
                    fontSize: 12,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const CustomText(
                        text: 'أنشأ حسابك الآن',
                        color: AppColors.purple100,
                        fontSize: 12,
                      ))
                ],
              ),
              CustomText(
                padding: EdgeInsetsDirectional.only(
                    top: ScreenHeight(8), bottom: ScreenHeight(15)),
                text: 'المتابعة كزائر',
                color: AppColors.purple100,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
