import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'config/app_colors.dart';
import 'config/app_strings.dart';
import 'controller/network_controller.dart';
import 'service/local_storage_service.dart';
import 'view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // Initialize Storage
  await Get.putAsync(() => LocalStorageService().init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final LocalStorageService storage = Get.find<LocalStorageService>();
    final Color primaryColor = storage.getPrimaryColor();
    final String themeModeStr = storage.getThemeMode();

    ThemeMode themeMode;
    switch (themeModeStr) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
    }

    return GetMaterialApp(
      title: AppStrings.appName,
      theme: _buildTheme(Brightness.light, primaryColor),
      darkTheme: _buildTheme(Brightness.dark, primaryColor),
      themeMode: themeMode,
      initialBinding: BindingsBuilder(() {
        Get.put(NetworkController());
      }),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      //Add for snackbar use
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
              builder: (_) => SafeArea(
                top: false,
                bottom: true,
                left: false,
                right: false,
                child: child!,
              ),
            ),
          ],
        );
      },
    );
  }

  ThemeData _buildTheme(Brightness brightness, Color primaryColor) {
    final bool isDark = brightness == Brightness.dark;

    final Color backgroundColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;

    final Color surfaceColor = isDark
        ? AppColors.darkSurface
        : AppColors.lightSurface;

    final Color cardColor = isDark ? AppColors.darkCard : AppColors.lightCard;

    final Color textPrimary = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      cardColor: cardColor,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: AppColors.secondary,
        onSecondary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        surface: surfaceColor,
        onSurface: textPrimary,
        outline: isDark ? AppColors.darkBorder : AppColors.lightBorder,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        isDark ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
      ).apply(bodyColor: textPrimary, displayColor: textPrimary),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        scrolledUnderElevation: 0,
        titleTextStyle: GoogleFonts.outfit(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: textPrimary, size: 20),
      ),
      dividerTheme: DividerThemeData(
        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
        thickness: 0.8,
      ),
      bottomAppBarTheme: BottomAppBarThemeData(
        color: isDark ? AppColors.darkSurface : Colors.white,
        elevation: 0,
      ),
    );
  }
}
