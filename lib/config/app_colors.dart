import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors - Yellow and Purple from the reference design
  static const Color primary = Color(0xFF6A1BBD); // Royal brand purple
  static const Color secondary = Color(0xFFF4C542); // Warm golden yellow
  static const Color accent = Color(0xFF8E3FD1); // Bright supporting purple
  static const Color lightOlive = Color(0xFFFFE082); // Soft gold highlight

  // Dark Mode - "Cosmic Gold" palette
  static const Color darkBackground = Color(0xFF120A1F); // Deep purple-black
  static const Color darkSurface = Color(0xFF1B102B); // Elevated dark purple
  static const Color darkCard = Color(0xFF24133A); // Layered card surface
  static const Color darkBorder = Color(0xFF4A2B73); // Muted purple border
  static const Color darkTextPrimary = Color(0xFFFFF8E7); // Warm near-white
  static const Color darkTextSecondary = Color(0xFFD3C2E8); // Soft lavender text
  static const Color darkTextMuted = Color(0xFF8B7AA6); // Muted purple-grey

  // Light Mode - warm white with purple accents
  static const Color lightBackground = Color(0xFFFFFCF5);
  static const Color lightSurface = Color(0xFFFFF7E8); // Warm cream surface
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE6D6F5); // Soft lavender border
  static const Color lightTextPrimary = Color(0xFF2D1846); // Deep plum text
  static const Color lightTextSecondary = Color(0xFF6A577E); // Muted plum-grey
  static const Color lightTextMuted = Color(0xFFA08FB8); // Soft muted lavender
  
  // States
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  static const Color googleBlue = Color(0xFF4285F4);
  
  // Utility Aliases
  static const Color surface = darkSurface;
  static const Color border = darkBorder;
  static const Color borderColor = darkBorder;
  static const Color borderGreyColor = darkBorder;
  static const Color warningColor = warning;
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF120A1F);
  static const Color greyColor = Color(0xFFA08FB8);
  static const Color transparentColor = Color(0x00000000);

  // Specific Palette
  static const Color darkDialogBackground = Color(0xFF20112F);
  static const Color textSlate600 = Color(0xFF7A6895);
  static const Color textSlate500 = Color(0xFFA08FB8);

  // Splash Screen Palette
  static const Color splashGradientTop = Color(0xFFE5C238);
  static const Color splashGradientMiddle = Color(0xFFB77E6B);
  static const Color splashGradientBottom = Color(0xFF6E1FB4);
  static const Color splashTitleText = Color(0xFFFFFFFF);
  static const Color splashSubtitleText = Color(0xF0FFFFFF);
  static const Color splashCaptionText = Color(0xB8FFFFFF);
  static const Color splashLogoShadow = Color(0x2E000000);

  // Auth Screen Palette
  static const Color authBackground = Color(0xFFF7F6F3);
  static const Color authCardBackground = Color(0xFFFFFFFF);
  static const Color authCardShadow = Color(0x12000000);
  static const Color authPrimaryText = Color(0xFF111111);
  static const Color authSecondaryText = Color(0xFF666666);
  static const Color authMutedText = Color(0xFF7A7A7A);
  static const Color authSegmentBackground = Color(0xFFF0F0F0);
  static const Color authSegmentSelectedBackground = Color(0xFFF4EAFE);
  static const Color authSegmentSelectedBorder = Color(0xFFB47BEF);
  static const Color authSegmentSelectedText = Color(0xFF6E1FB4);
  static const Color authSegmentUnselectedText = Color(0xFF6E6E6E);
  static const Color authInputBackground = Color(0xFFFFFFFF);
  static const Color authInputBorder = Color(0xFFBBBBBB);
  static const Color authPrimaryButton = Color(0xFF6E1FB4);
  static const Color authPrimaryButtonText = Color(0xFFFFFFFF);
  static const Color authSecondaryButtonBackground = Color(0xFFFFFFFF);
  static const Color authSecondaryButtonBorder = Color(0xFFBDBDBD);
  static const Color authSecondaryButtonText = Color(0xFF2F2F2F);
  static const Color authOtpFilledBackground = Color(0xFFEADAFD);
  static const Color authOtpBorder = Color(0xFFC8C0CF);
  static const Color authOtpCursor = Color(0xFF2F2F2F);
  static const Color authRoleUserBorder = Color(0xFFB47BEF);
  static const Color authRoleUserIconBackground = Color(0xFF6E1FB4);
  static const Color authRoleUserButton = Color(0xFF6E1FB4);
  static const Color authRoleUserBullet = Color(0xFF7B7B7B);
  static const Color authRoleAstrologerIconBackground = Color(0xFFF2CF3B);
  static const Color authRoleAstrologerButton = Color(0xFFF2CF3B);
  static const Color authRoleAstrologerButtonText = Color(0xFFFFFFFF);

  // Home Screen Palette
  static const Color homeGradientTop = Color(0xFFD9AB35);
  static const Color homeGradientBottom = Color(0xFF6E1FB4);
  static const Color homeSearchBackground = Color(0x26FFFFFF);
  static const Color homeSearchText = Color(0xE6FFFFFF);
  static const Color homeSectionTitle = Color(0xFF39224D);
  static const Color homeSoftCard = Color(0xFFFFFFFF);
  static const Color homeSoftPurple = Color(0xFFF1E4FF);
  static const Color homeSoftPurpleText = Color(0xFF6321A1);
  static const Color homeSessionCard = Color(0xFFC1207F);
  static const Color homeSessionChip = Color(0xFFF5D35B);
  static const Color homeSessionChipText = Color(0xFF7A1E57);
  static const Color homeServiceCardBorder = Color(0xFFEDE2F8);
  static const Color homePlaceholderBackground = Color(0xFFF7F1FD);
  static const Color homePlaceholderBorder = Color(0xFFD4B9F6);
  static const Color homePlaceholderText = Color(0xFF8E73AE);
  static const Color homeAstrologerMeta = Color(0xFF8A8792);
  static const Color homeActionBorder = Color(0xFFD8B6F7);
  static const Color homeTrendingPink = Color(0xFFC1207F);
  static const Color homeTrendingYellow = Color(0xFFF2CF3B);
  static const Color homeBottomNavBorder = Color(0xFFEADCF7);
  static const Color homeBottomNavInactive = Color(0xFF8E73AE);
  static const Color homeBackground = Color(0xFFFAFAFC);
  static const Color homeHeaderGradientMid = Color(0xFFB25B8F);
  static const Color homeHeaderWelcomeText = Color(0xCCFFFFFF);
  static const Color homeSearchBorder = Color(0x40FFFFFF);
  static const Color homeCardBorder = Color(0xFFF0E5FA);
  static const Color homeHoroscopeGradientTop = Color(0x33E0B43B);
  static const Color homeHoroscopeGradientMid = Color(0x33B25B8F);
  static const Color homeHoroscopeGradientBottom = Color(0x336E1FB4);
  static const Color homeLiveGradientTop = Color(0xFFE02D7F);
  static const Color homeLiveGradientBottom = Color(0xFF9A1DD3);
  static const Color homeLiveShadow = Color(0x16000000);
  static const Color homeLiveBadge = Color(0xFFD80000);
  static const Color homeViewersBadge = Color(0x59FFFFFF);
  static const Color homeLiveSecondaryText = Color(0xD9FFFFFF);
  static const Color homeCardShadow = Color(0x0C000000);
  static const Color homeServiceShadow = Color(0x12000000);
  static const Color homeZodiacUnselected = Color(0xFFF1F1F1);
  static const Color homeRatingStar = Color(0xFFF5C400);
  static const Color homeOnlineText = Color(0xFF0BAA34);
  static const Color homeTrendingSubtitleDark = Color(0xCC3E3150);
  static const Color homeTrendingYellowEnd = Color(0xFFE0A83A);
  static const Color homeTrendingPinkEnd = Color(0xFF8D1ED0);
  static const Color homeNavShadow = Color(0x0A000000);
  static const Color homeNavIndicatorStart = Color(0xFFF0C63C);
  static const Color homeNavIndicatorEnd = Color(0xFF8B3ED0);
  static const Color homeNavActiveText = Color(0xFFB56C67);
  static const Color homeNavInactiveIcon = Color(0xFF474747);
  static const Color homeNavInactiveText = Color(0xFF1F1F1F);
  static const Color homeNotificationBorder = Color(0x59FFFFFF);
  static const Color homeNotificationBackground = Color(0x24FFFFFF);
  static const Color homeNotificationBadge = Color(0xFFFF3B30);
  
  // Transparent / Alpha Alises
  static const Color black26 = Color(0x42000000);
  static const Color white70 = Color(0xB3FFFFFF);
  static const Color black70 = Color(0xB3000000);
  static const Color white38 = Color(0x61FFFFFF);
  static const Color black38 = Color(0x61000000);
}
