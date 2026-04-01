import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  static const int green = 0;
  static const int yellow = 1;
  static const int red = 2;

  final String title;
  final String btPositive;
  final String btNegative;
  final int type;
  final bool isHideNegative;
  final String msg;
  final VoidCallback onPositive;
  final VoidCallback? onNagative;

  const CustomAlertDialog({
    super.key,
    this.title = "Warning",
    this.btPositive = "Yes",
    this.btNegative = "Cancel",
    this.type = 1,
    this.isHideNegative = false,
    required this.msg,
    required this.onPositive,
    this.onNagative,
  });

  const CustomAlertDialog.m({
    super.key,
    this.title = "Warning",
    this.btPositive = "Yes",
    this.btNegative = "Cancel",
    this.type = 1,
    this.isHideNegative = false,
    required this.msg,
    required this.onPositive,
    required this.onNagative,
  });

  @override
  Widget build(BuildContext context) {
    Color baseColor = AppColors.warningColor;
    if (type == red) {
      baseColor = Colors.red;
    } else if (type == 3) { // Assuming 3 is success
      baseColor = Colors.green;
    }

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: baseColor, fontSize: 18),
            ),
            const SizedBox(height: 12),
            Text(msg, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!isHideNegative)
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onNagative?.call();
                    },
                    child: Text(
                      btNegative,
                      style: const TextStyle(color: Colors.black38),
                    ),
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPositive();
                  },
                  child: Text(btPositive, style: TextStyle(color: baseColor)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
