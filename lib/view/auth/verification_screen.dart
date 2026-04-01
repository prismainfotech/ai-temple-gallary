import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../config/app_colors.dart';
import '../../config/app_strings.dart';
import '../../widget/app_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({
    super.key,
    this.phoneNumber = AppStrings.mobileNumberHint,
  });

  final String phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late final TextEditingController _otpController;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController(text: '2');
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PinTheme defaultPinTheme = PinTheme(
      width: 72,
      height: 52,
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.authPrimaryText,
      ),
      decoration: BoxDecoration(
        color: AppColors.authInputBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.authOtpBorder),
      ),
    );

    final PinTheme focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.authSegmentSelectedBorder, width: 1.5),
    );

    final PinTheme submittedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.authOtpFilledBackground,
      border: Border.all(color: AppColors.authOtpBorder),
    );

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
                    Text(
                      AppStrings.verificationTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.authPrimaryText,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          color: AppColors.authSecondaryText,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.35,
                        ),
                        children: [
                          const TextSpan(
                            text: '${AppStrings.verificationCodeSentTo} ',
                          ),
                          TextSpan(
                            text: widget.phoneNumber,
                            style: const TextStyle(
                              color: AppColors.authPrimaryText,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    const Text(
                      AppStrings.enterOtp,
                      style: TextStyle(
                        color: AppColors.authPrimaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Pinput(
                      controller: _otpController,
                      autofocus: true,
                      length: 4,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 6),
                      cursor: Container(
                        width: 2,
                        height: 24,
                        color: AppColors.authOtpCursor,
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    const SizedBox(height: 22),
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
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: Get.back,
                      child: const Text(
                        AppStrings.changeNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.authSecondaryButtonText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.authSecondaryButtonText,
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      AppStrings.termsAgreement,
                      textAlign: TextAlign.center,
                      style: TextStyle(
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
