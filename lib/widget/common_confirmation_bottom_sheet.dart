import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/app_colors.dart';
import 'app_button.dart';
import 'bottom_sheet_title.dart';

class CommonConfirmationBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final String confirmButtonTitle;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String cancelButtonTitle;

  const CommonConfirmationBottomSheet({
    super.key,
    required this.title,
    required this.description,
    this.confirmButtonTitle = "Confirm",
    required this.onConfirm,
    this.onCancel,
    this.cancelButtonTitle = "Cancel",
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBackground : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BottomSheetTitle(title: title),
            const SizedBox(height: 16),
            Text(
              description, 
              style: TextStyle(
                fontSize: 14, 
                height: 1.5,
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              )
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: CommonButton(
                    title: cancelButtonTitle,
                    textColor: isDark ? Colors.white : AppColors.primary,
                    backColor: Colors.transparent,
                    borderColor: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    onTap: () {
                      Get.back();
                      if (onCancel != null) onCancel!();
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CommonButton(
                    title: confirmButtonTitle,
                    backColor: Colors.redAccent,
                    onTap: () {
                      Get.back();
                      onConfirm();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
