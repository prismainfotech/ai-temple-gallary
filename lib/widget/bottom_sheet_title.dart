import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

class BottomSheetTitle extends StatelessWidget {
  final String title;
  final VoidCallback? voidCallback;

  const BottomSheetTitle({super.key, required this.title, this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      trailing: GestureDetector(
        onTap: () {
          Get.back();
          voidCallback?.call();
        },
        child: const Icon(Remix.close_line),
      ),
    );
  }
}
