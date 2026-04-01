import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:remixicon/remixicon.dart';

import '../config/app_colors.dart';
import '../config/app_strings.dart';
import '../widget/app_button.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final RxBool hasInternet = true.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _updateConnectionStatus,
    );
  }

  @override
  void onReady() {
    super.onReady();
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    bool result = await InternetConnectionChecker.instance.hasConnection;
    hasInternet.value = result;
    if (!result) _showNoInternetDialog();
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    // Only verify connection if we think we might be disconnected or just connected
    bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if (!isConnected) {
      hasInternet.value = false;
      // If we are already showing dialog, don't show again.
      // If it's not open, show it.
      if (Get.isDialogOpen != true) {
        _showNoInternetDialog();
      }
    } else {
      hasInternet.value = true;
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }
  }

  void showNoInternetDialog({VoidCallback? onConnected}) {
    if (Get.isDialogOpen == true) {
      if (onConnected != null) {
        Get.back(); // Close existing dialog to replace with one that has callback
        Future.delayed(const Duration(milliseconds: 150), () {
          _showNoInternetDialog(onConnected: onConnected);
        });
        return;
      }
      return;
    }
    _showNoInternetDialog(onConnected: onConnected);
  }

  void _showNoInternetDialog({VoidCallback? onConnected}) {
    // ... existing implementation ...

    Get.dialog(
      PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                color: Get.isDarkMode ? AppColors.darkDialogBackground : AppColors.whiteColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Remix.wifi_off_line,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    AppStrings.noInternetTitle,
                    style: GoogleFonts.outfit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppStrings.noInternetDesc,
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.isDarkMode
                          ? Colors.grey[400]
                          : Colors.grey[600],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CommonButton(
                    title: AppStrings.tryAgain,
                    backColor: Get.theme.primaryColor,
                    textColor: Colors.white,
                    onTap: () async {
                      bool result = await InternetConnectionChecker
                          .instance
                          .hasConnection;
                      if (result) {
                        hasInternet.value = true;
                        Get.back();
                        if (onConnected != null) {
                          onConnected();
                        }
                      }
                    },
                    borderRadius: 16,
                    isExpand: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
