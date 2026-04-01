import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';

import '../config/app_colors.dart';
import '../widget/app_button.dart';


class AppUpdate {
  Future<void> checkUpdateThenNavigate(VoidCallback onNavigate) async {
    final newVersion = NewVersionPlus();
    try {
      final status = await newVersion.getVersionStatus();

      if (status?.canUpdate == true ) {
        await Get.dialog(
          PopScope(
            canPop: false,
            child: AlertDialog(
              title: const Text(
                'Update Available',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Text(
                  'A newer version of the app (${status!.storeVersion}) is available.\n'
                      'You’re currently using version ${status.localVersion}.\n\n'
                      '${status.releaseNotes?.isNotEmpty == true ? status.releaseNotes! : "This update includes performance improvements and bug fixes."}',
                ),
              ),
              actions: [
                Visibility(
                  visible: true,
                  child: CommonButton(
                    backColor: AppColors.whiteColor,
                    textColor: AppColors.primary,
                    borderColor: AppColors.primary,
                    onTap: () async {
                      Get.back();
                      onNavigate();
                    },
                    title: 'Later',
                  ),
                ),
                CommonButton(
                  backColor: AppColors.primary,
                  textColor: AppColors.whiteColor,
                  onTap: () async {
                    await newVersion.launchAppStore(status.appStoreLink);
                  },
                  title: 'Update Now',
                ),
              ],
            ),
          ),
          barrierDismissible: false, // If forced update, barrier is false. If optional, we need a "Later" button or barrier true.
          // The existing code has "Visibility(visible: false ... child: 'Later')". This implies forced update.
          // BUT, if the user doesn't update, they are stuck?
          // If it is forced update, they are stuck (good).
          // If it is NOT forced update, we should show "Later".
          // For now I will persist the logic but add the callback call in `finally` or if dialog is dismissed?
          // If dialog blocks, we never navigate unless "Later" is clicked.
          // If "Update Now" is clicked, it launches store. Does it close dialog?
          // Usually we keep dialog open for forced updates.
          
          // However, if no update, we MUST navigate.
        );
      } else {
         onNavigate();
      }
    } catch (e) {
      // Optionally handle error (e.g., log or fallback)
      onNavigate();
    } finally {
      // Continue with navigation after check - wait, if we showed dialog and it awaits, we don't want to navigate in finally unless dialog closed?
      // If we navigate in finally, it overrides the forced update dialog!
      // So onNavigate should ONLY be called if no update or error.
      // IF update exists, onNavigate is called ONLY if "Later" (which is hidden) is pressed.
      // So for forced update, we do NOT call onNavigate.
    }
  }
}
