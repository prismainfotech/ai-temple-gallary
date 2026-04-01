import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_strings.dart';
import '../home/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  late final List<Widget> _pages = const [
    HomeScreen(),
    _DashboardPlaceholder(title: AppStrings.homeNavAstrologers),
    _DashboardPlaceholder(title: AppStrings.homeNavWallet),
    _DashboardPlaceholder(title: AppStrings.homeNavChat),
    _DashboardPlaceholder(title: AppStrings.homeNavSettings),
  ];

  @override
  Widget build(BuildContext context) {
    const items = [
      (
        AppImages.homeNav,
        AppImages.homeActNav,
      ),
      (
        AppImages.astrologersNav,
        AppImages.astrologersActNav,
      ),
      (
        AppImages.walletNav,
        AppImages.walletActNav,
      ),
      (
        AppImages.chatNav,
        AppImages.chatActNav,
      ),
      (
        AppImages.settingsNav,
        AppImages.settingsActNav,
      ),
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparentColor,
        statusBarIconBrightness:
            _currentIndex == 0 ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            _currentIndex == 0 ? Brightness.dark : Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.homeBackground,
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            border: Border(
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.homeNavShadow,
                blurRadius: 6,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Row(
              children: List.generate(items.length, (index) {
                final selected = _currentIndex == index;
                final item = items[index];
                return Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          margin: const EdgeInsets.only(bottom: 6),
                          width: selected ? 44 : 0,
                          height: 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(999),
                            gradient: selected
                                ? const LinearGradient(
                                    colors: [
                                      AppColors.homeNavIndicatorStart,
                                      AppColors.homeNavIndicatorEnd,
                                    ],
                                  )
                                : null,
                          ),
                        ),
                        Image.asset(
                          selected ? item.$2 : item.$1,
                          height: 48,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardPlaceholder extends StatelessWidget {
  const _DashboardPlaceholder({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.homeBackground,
      child: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.homeServiceShadow,
                  blurRadius: 18,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.authPrimaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Placeholder screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.authSecondaryText,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
