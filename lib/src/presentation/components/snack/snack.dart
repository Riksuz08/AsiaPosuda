import 'package:another_flushbar/flushbar.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:medion_client_mobile/src/config/themes/app_colors.dart';
import 'package:medion_client_mobile/src/config/themes/app_utils.dart';

import '../../../core/utils/constants.dart';

class Snack {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: AppUtils.kPaddingAll16,
        behavior: SnackBarBehavior.fixed,
        backgroundColor: AppColors.assets,
        clipBehavior: Clip.antiAlias,
        dismissDirection: DismissDirection.none,
        content: Text(message),
      ),
    );
  }

  static showCustomFlushBar(
    BuildContext context, {
    Color? leadingColor,
    String? message,
    Duration? duration,
    bool? isDismiss,
  }) {
    return Flushbar(
      leftBarIndicatorColor: leadingColor,
      endOffset: const Offset(0, .16),
      isDismissible: true,
      blockBackgroundInteraction: true,
      backgroundColor: Colors.white,
      flushbarStyle: FlushbarStyle.FLOATING,
      onTap: (flushbar) {
        flushbar.dismiss();
      },
      barBlur: 5,
      boxShadows: const [
        BoxShadow(
          color: AppColors.grey15Transparent,
          blurRadius: 12,
        ),
      ],
      mainButton: const Padding(
        padding: EdgeInsets.only(right: 12),
        child: Icon(
          Icons.close,
          color: Colors.grey,
        ),
      ),
      duration: duration ?? const Duration(seconds: 2),
      titleColor: AppColors.black,
      flushbarPosition: FlushbarPosition.TOP,
      padding: AppUtils.kPaddingAll16,
      margin: AppUtils.kPaddingHorizontal16,
      borderRadius: AppUtils.kBorderRadius12,
      message: message ?? 'message',
      messageColor: AppColors.black,
      messageSize: 15,
    ).show(context);
  }

  static void showTopFlash(
      {required BuildContext context,
      required String snackText,
      FlashBehavior style = FlashBehavior.floating}) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      persistent: true,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: AppColors.assets,
          //brightness: Brightness.light,
          boxShadows: const [BoxShadow(blurRadius: 4)],
          // //barrierBlur: 3.0,
          //barrierColor: Colors.black38,
          barrierDismissible: true,
          behavior: style,
          position: FlashPosition.top,
          borderRadius: BorderRadius.circular(16),
          margin: AppUtils.kPaddingAll16,
          // useSafeArea: true,
          borderColor: AppColors.transparent,
          borderWidth: 0,
          //constraints: BoxConstraints.tight(const Size.fromHeight(100)),
          child: FlashBar(
            title: Center(
              child: Text(snackText,
                  style: const TextStyle(
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center),
            ),
            content: const SizedBox(),
            // primaryAction: TextButton(
            //   onPressed: () => controller.dismiss(),
            //   child:
            //       const Text('DISMISS', style: TextStyle(color: Colors.amber)),
            // ),
          ),
        );
      },
    );
  }

  static void showCustomFlash(
    String message, {
    required BuildContext context,
    Color? color,
    Color? backgroundColor = AppColors.white,
    Color? iconColor = AppColors.snackIconColor,
    Color? textColor = AppColors.text2,
    FlashPosition position = FlashPosition.top,
    Alignment? alignment,
  }) {
    showFlash(
      context: AppConstants.navigatorKey.currentContext!,
      duration: const Duration(milliseconds: 2000),
      builder: (_, controller) {
        return Flash(
          boxShadows: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
          controller: controller,
          backgroundColor: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          borderColor: Colors.transparent,
          position: position,
          behavior: FlashBehavior.floating,
          margin: const EdgeInsets.all(12),
          alignment: alignment,
          enableVerticalDrag: true,
          onTap: () => controller.dismiss(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 48,
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 8,
                    color: color,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            message,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.dismiss();
                          },
                          icon: Icon(
                            Icons.close,
                            color: iconColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
