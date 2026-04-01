import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';
import '../config/app_colors.dart';
import 'app_button.dart';

class CommonDialog {
  static void shownErrorDialog({
    required Function() onTap,
    String? title,
    String? description,
    IconData? icon,
    bool isError = true,
  }) {
    if (Get.isDialogOpen == true) return;

    Get.dialog(
      PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? AppColors.darkDialogBackground : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isError
                          ? Colors.red.withValues(alpha: 0.1)
                          : Colors.green.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon ?? (isError ? Remix.alert_line : Remix.check_line),
                      color: isError ? Colors.red : Colors.green,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    title ?? 'Error',
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description ?? 'Something went wrong',
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.isDarkMode
                          ? Colors.grey[400]
                          : Colors.grey[600],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CommonButton(
                    title: 'Try Again',
                    backColor: Get.theme.primaryColor,
                    textColor: Colors.white,
                    onTap: () {
                      Get.back(); // Close this dialog
                      onTap();
                    },
                    borderRadius: 16,
                    isExpand: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
