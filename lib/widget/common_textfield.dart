import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/app_colors.dart';
import '../utils/validator.dart';

class CommonTextField extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? validationMessage;
  final bool needValidation;
  final bool isEmailValidation;
  final double? topPadding;
  final double? bottomPadding;
  final TextEditingController? controller;
  final bool isPhoneValidation;
  final bool isPasswordValidation;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? maxLength;
  final double? borderRadius;
  final Widget? suffixIcon;
  final Color? borderColor;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool isTransparentColorBorder;
  final bool isBigTitle;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final bool obscureText;
  final Color? titleColor;
  final bool readOnly;
  final Color? bgColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titleMargin;
  final Iterable<String>? autofillHints;

  const CommonTextField({
    super.key,
    this.title,
    this.needValidation = false,
    this.isEmailValidation = false,
    this.hintText,
    this.validationMessage,
    this.topPadding,
    this.borderColor,
    this.bottomPadding,
    this.controller,
    this.focusNode,
    this.autofocus = false,
    this.readOnly = false,
    this.autofillHints,
    this.contentPadding,
    this.isPhoneValidation = false,
    this.textInputType,
    this.textAlign,
    this.borderRadius,
    this.inputFormatters,
    this.maxLine,
    this.maxLength,
    this.bgColor,
    this.isTransparentColorBorder = false,
    this.onTap,
    this.suffixIcon,
    this.isBigTitle = false,
    this.prefixIcon,
    this.validator,
    this.titleColor,
    this.isPasswordValidation = false,
    this.obscureText = false,
    this.onChange,
    this.margin,
    this.titleMargin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultFillColor = isDark 
        ? AppColors.surface.withValues(alpha: 0.5)
        : Colors.grey[100];
    final defaultBorderColor = isDark
        ? AppColors.border.withValues(alpha: 0.5)
        : Colors.grey[300];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: topPadding ?? 0),
        if (title != null)
          Container(
            margin: titleMargin ?? const EdgeInsets.only(left: 4),
            child: Text(
              '$title',
              style: TextStyle(
                fontSize: isBigTitle ? 18 : 14,
                fontWeight: isBigTitle ? FontWeight.bold : FontWeight.w600,
                color: titleColor ?? (isDark ? Colors.grey[400] : Colors.grey[700]),
              ),
            ),
          ),
        if (title != null) const SizedBox(height: 8),
        Container(
          margin: margin,
          child: TextFormField(
            autofillHints: autofillHints,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: maxLine ?? 1,
            textInputAction: TextInputAction.done,
            textAlign: textAlign ?? TextAlign.start,
            onTap: onTap,
            maxLength: maxLength,
            controller: controller,
            onChanged: onChange,
            obscureText: obscureText,
            readOnly: readOnly,
            inputFormatters: inputFormatters ?? [],
            focusNode: focusNode,
            autofocus: autofocus,
            keyboardType: textInputType ?? TextInputType.text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.white : Colors.black,
            ),
            decoration: InputDecoration(
              fillColor: bgColor ?? defaultFillColor,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              isDense: true,
              filled: true,
              counterText: "",
              hintText: hintText ?? "",
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintStyle: TextStyle(
                color: isDark ? Colors.grey[600] : Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isTransparentColorBorder ? Colors.transparent : (borderColor ?? defaultBorderColor!),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isTransparentColorBorder ? Colors.transparent : (borderColor ?? defaultBorderColor!),
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isTransparentColorBorder ? Colors.transparent : (borderColor ?? theme.primaryColor),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(borderRadius ?? 16),
              ),
            ),
            validator: needValidation
                ? validator ??
                    (v) {
                      return TextFieldValidation.validation(
                          message: validationMessage ?? title,
                          value: v,
                          isPasswordValidator: isPasswordValidation,
                          isPhone: isPhoneValidation,
                          isEmailValidator: isEmailValidation);
                    }
                : null,
          ),
        ),
        SizedBox(height: bottomPadding ?? 16),
      ],
    );
  }
}
