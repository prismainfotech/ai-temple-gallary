import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onTap;
  final bool isExpand;
  final double? buttonWidth;
  final double? borderWidth;
  final double? borderRadius;
  final double? textSize;
  final Color? backColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? borderColor;
  final double? height;
  final bool isShadow;
  final Widget? iconWidget;
  final EdgeInsets? buttonPadding;
  final EdgeInsetsGeometry? margin;
  final Widget? suffixIcon;

  const CommonButton({
    super.key,
    this.title,
    this.icon,
    this.onTap,
    this.isExpand = false,
    this.buttonWidth,
    this.borderWidth,
    this.borderRadius,
    this.textSize,
    this.backColor,
    this.textColor,
    this.textStyle,
    this.borderColor,
    this.height,
    this.isShadow = false,
    this.iconWidget,
    this.buttonPadding,
    this.margin,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = backColor ?? Theme.of(context).primaryColor;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        width: isExpand ? double.infinity : buttonWidth,
        height: height,
        padding: buttonPadding ??
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          boxShadow: isShadow
              ? [
                  BoxShadow(
                    color: bgColor.withValues(alpha: 0.3),
                    blurRadius: 15.0,
                    spreadRadius: 2,
                    offset: const Offset(0.0, 8),
                    blurStyle: BlurStyle.outer,
                  )
                ]
              : null,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth ?? 1.5)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconWidget != null) ...[
              iconWidget!,
              const SizedBox(width: 8),
            ] else if (icon != null) ...[
              Icon(
                icon,
                color: textColor ?? Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                title ?? "",
                style: textStyle ??
                    TextStyle(
                      fontSize: textSize ?? 16,
                      fontWeight: FontWeight.bold,
                      color: textColor ?? Colors.white,
                      letterSpacing: 0.5,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(width: 10),
              suffixIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
