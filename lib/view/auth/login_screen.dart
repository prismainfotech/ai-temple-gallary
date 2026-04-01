import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_strings.dart';
import '../../widget/app_button.dart';
import '../../widget/common_textfield.dart';
import 'role_selection_screen.dart';
import 'verification_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isMobileSelected = true;

  final TextEditingController _mobileController =
      TextEditingController(text: AppStrings.mobileNumberHint);
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    _emailController.dispose();
    super.dispose();
  }

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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.fromLTRB(18, 20, 18, 22),
                decoration: BoxDecoration(
                  color: AppColors.authCardBackground,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.authCardShadow,
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Container(
                        width: 82,
                        height: 82,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.splashGradientTop,
                              AppColors.splashGradientBottom,
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: ClipOval(
                          child: Image.asset(
                            AppImages.logo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      AppStrings.welcomeBack,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.authPrimaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      AppStrings.startSpiritualJourney,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.authSecondaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _AuthTabSelector(
                      isMobileSelected: _isMobileSelected,
                      onChanged: (isMobile) {
                        setState(() {
                          _isMobileSelected = isMobile;
                        });
                      },
                    ),
                    const SizedBox(height: 22),
                    CommonTextField(
                      title: _isMobileSelected
                          ? AppStrings.mobileNumberLabel
                          : AppStrings.emailLabel,
                      controller:
                          _isMobileSelected ? _mobileController : _emailController,
                      hintText: _isMobileSelected
                          ? AppStrings.mobileNumberHint
                          : AppStrings.emailHint,
                      textInputType: _isMobileSelected
                          ? TextInputType.phone
                          : TextInputType.emailAddress,
                      bgColor: AppColors.authInputBackground,
                      borderColor: AppColors.authInputBorder,
                      borderRadius: 12,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      titleColor: AppColors.authPrimaryText,
                      bottomPadding: 20,
                    ),
                    CommonButton(
                      title: AppStrings.continueButton,
                      isExpand: true,
                      borderRadius: 12,
                      backColor: AppColors.authPrimaryButton,
                      textColor: AppColors.authPrimaryButtonText,
                      textStyle: const TextStyle(
                        color: AppColors.authPrimaryButtonText,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      onTap: () {
                        if (_isMobileSelected) {
                          Get.to(
                            () => VerificationScreen(
                              phoneNumber: _mobileController.text.trim().isEmpty
                                  ? AppStrings.mobileNumberHint
                                  : _mobileController.text.trim(),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 18),
                    CommonButton(
                      title: AppStrings.loginAsUser,
                      isExpand: true,
                      borderRadius: 12,
                      backColor: AppColors.authSecondaryButtonBackground,
                      borderColor: AppColors.authSecondaryButtonBorder,
                      textColor: AppColors.authSecondaryButtonText,
                      textStyle: const TextStyle(
                        color: AppColors.authSecondaryButtonText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        Get.to(() => const RoleSelectionScreen());
                      },
                    ),
                    const SizedBox(height: 20),
                    CommonButton(
                      title: AppStrings.joinAsAstrologer,
                      isExpand: true,
                      borderRadius: 12,
                      backColor: AppColors.authSecondaryButtonBackground,
                      borderColor: AppColors.authSecondaryButtonBorder,
                      textColor: AppColors.authSecondaryButtonText,
                      textStyle: const TextStyle(
                        color: AppColors.authSecondaryButtonText,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      onTap: () {
                        Get.to(() => const RoleSelectionScreen());
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppStrings.termsAgreement,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.authMutedText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthTabSelector extends StatelessWidget {
  const _AuthTabSelector({
    required this.isMobileSelected,
    required this.onChanged,
  });

  final bool isMobileSelected;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.authSegmentBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SegmentTab(
              label: AppStrings.mobileNumberTab,
              isSelected: isMobileSelected,
              onTap: () => onChanged(true),
            ),
          ),
          Expanded(
            child: _SegmentTab(
              label: AppStrings.emailTab,
              isSelected: !isMobileSelected,
              onTap: () => onChanged(false),
            ),
          ),
        ],
      ),
    );
  }
}

class _SegmentTab extends StatelessWidget {
  const _SegmentTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.authSegmentSelectedBackground
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.authSegmentSelectedBorder
                : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? AppColors.authSegmentSelectedText
                : AppColors.authSegmentUnselectedText,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
