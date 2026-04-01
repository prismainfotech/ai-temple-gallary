import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/app_strings.dart';
import '../../widget/app_button.dart';
import '../dashboard/dashboard_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.authBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(14, 56, 14, 24),
            child: Column(
              children: [
                Text(
                  AppStrings.whoAreYouTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.authPrimaryText,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  AppStrings.whoAreYouSubtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.authSecondaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                _RoleCard(
                  icon: Icons.person,
                  iconBackground: AppColors.authRoleUserIconBackground,
                  borderColor: AppColors.authRoleUserBorder,
                  title: AppStrings.iAmUserTitle,
                  subtitle: AppStrings.iAmUserSubtitle,
                  bulletOne: AppStrings.userFeatureOne,
                  bulletTwo: AppStrings.userFeatureTwo,
                  bulletThree: AppStrings.userFeatureThree,
                  buttonText: AppStrings.continueAsUser,
                  buttonColor: AppColors.authRoleUserButton,
                  buttonTextColor: AppColors.authPrimaryButtonText,
                  highlighted: true,
                  onTap: () {
                    Get.to(() => const DashboardScreen());
                  },
                ),
                const SizedBox(height: 24),
                const _RoleCard(
                  icon: Icons.star,
                  iconBackground: AppColors.authRoleAstrologerIconBackground,
                  borderColor: Colors.transparent,
                  title: AppStrings.iAmAstrologerTitle,
                  subtitle: AppStrings.iAmAstrologerSubtitle,
                  bulletOne: AppStrings.astrologerFeatureOne,
                  bulletTwo: AppStrings.astrologerFeatureTwo,
                  bulletThree: AppStrings.astrologerFeatureThree,
                  buttonText: AppStrings.continueAsAstrologer,
                  buttonColor: AppColors.authRoleAstrologerButton,
                  buttonTextColor: AppColors.authRoleAstrologerButtonText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.iconBackground,
    required this.borderColor,
    required this.title,
    required this.subtitle,
    required this.bulletOne,
    required this.bulletTwo,
    required this.bulletThree,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    this.highlighted = false,
    this.onTap,
  });

  final IconData icon;
  final Color iconBackground;
  final Color borderColor;
  final String title;
  final String subtitle;
  final String bulletOne;
  final String bulletTwo;
  final String bulletThree;
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 420),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.authCardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor),
        boxShadow: const [
          BoxShadow(
            color: AppColors.authCardShadow,
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: iconBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: AppColors.whiteColor,
                size: 32,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.authPrimaryText,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.authSecondaryText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 18),
          _BulletText(text: bulletOne),
          const SizedBox(height: 8),
          _BulletText(text: bulletTwo),
          const SizedBox(height: 8),
          _BulletText(text: bulletThree),
          const SizedBox(height: 20),
          CommonButton(
            title: buttonText,
            isExpand: true,
            borderRadius: 12,
            backColor: buttonColor,
            textColor: buttonTextColor,
            textStyle: TextStyle(
              color: buttonTextColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class _BulletText extends StatelessWidget {
  const _BulletText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            '•',
            style: TextStyle(
              color: AppColors.authRoleUserBullet,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.authSecondaryText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
