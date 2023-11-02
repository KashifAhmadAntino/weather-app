import 'package:flutter/material.dart';
import 'package:weather/constants/app_color.dart';

class ProgressDialog {
  static void openProgressDialog(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SizedBox(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(40),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.kPureWhite),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: AppColors.kPureBlack,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void closeProgressDialog(
      {VoidCallback? onDialogClosed, required BuildContext context}) {
    if (true) {
      Future.delayed(const Duration(milliseconds: 400), () {
        Navigator.pop(context);
        if (onDialogClosed != null) {
          onDialogClosed();
        }
      });
      // Get.back();
    }
  }
}
