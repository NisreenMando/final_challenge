import 'package:bot_toast/bot_toast.dart';
import 'package:fluter_template/core/data/enums/message_type.dart';
import 'package:fluter_template/ui/shared/colors.dart';
import 'package:fluter_template/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomToast {
  static showMessage(
      {Size? size,
      required String message,
      MessageType? messageType = MessageType.INFO}) {
    String imageName = 'assets/images/info.svg';
    Color shadowColor = AppColors.blue;

    switch (messageType) {
      case MessageType.REJECTED:
        imageName = 'assets/images/rejected-01.svg';
        shadowColor = AppColors.red;
        break;
      case MessageType.SUCSSES:
        imageName = 'assets/images/approved1-01.svg';
        shadowColor = AppColors.green;
        break;
      case MessageType.WARNING:
        imageName = 'assets/images/warning.svg';
        shadowColor = AppColors.amber300;
        break;
      case MessageType.INFO:
        imageName = 'assets/images/info.svg';
        shadowColor = AppColors.blue;
        break;
      default:
        break;
    }

    BotToast.showCustomText(
        duration: const Duration(seconds: 15),
        toastBuilder: (value) {
          return Container(
            width: ScreenWidth(2),
            height: ScreenWidth(5),
            decoration: BoxDecoration(
                //   color: AppColors.green,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                    //  height: size.width * 0.06,
                    ),
                SvgPicture.asset(
                  imageName,
                  //  width: size.width * 0.1,
                  // height: size.width * 0.1,
                ),
                const SizedBox(
                    //    height: size.width * 0.06,
                    ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      //fontSize:  size.width * 0.045
                      ),
                ),
                const SizedBox(
                    //height: size.width * 0.06,
                    ),
              ],
            ),
          );
        });
  }
}
