import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import '../widget/app_button.dart';

class NoDataView extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  final String titleText;
  final bool isButtonNeed;
  final String subTitleText;
  final IconData? icon;

  const NoDataView({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.titleText,
    required this.subTitleText,
    this.isButtonNeed = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(
                      icon ?? Remix.inbox_line,
                      size: 80,
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    titleText,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      subTitleText,
                      style: TextStyle(color: Colors.grey[600], height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
        if (isButtonNeed)
          CommonButton(
            onTap: onTap,
            title: buttonText,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
            isExpand: true,
            borderRadius: 16,
          )
      ],
    );
  }
}
