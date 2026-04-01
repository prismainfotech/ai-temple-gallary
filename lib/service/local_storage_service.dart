import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/storage_keys.dart';
import '../config/app_colors.dart';

class LocalStorageService extends GetxService {
  late GetStorage _box;

  Future<LocalStorageService> init() async {
    await GetStorage.init();
    _box = GetStorage(); // Default box
    return this;
  }

  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  Future<void> erase() async {
    await _box.erase();
  }

  // Theme Helpers
  String getThemeMode() => read<String>(StorageKeys.themeMode) ?? "system";
  Future<void> saveThemeMode(String mode) => write(StorageKeys.themeMode, mode);

  Color getPrimaryColor() {
    final int? colorValue = read<int>(StorageKeys.primaryColor);
    return colorValue != null ? Color(colorValue) : AppColors.primary;
  }
  Future<void> savePrimaryColor(Color color) => write(StorageKeys.primaryColor, color.toARGB32());

  bool getOnboardingStatus() => read<bool>(StorageKeys.hasCompletedOnboarding) ?? false;
  Future<void> saveOnboardingStatus(bool status) => write(StorageKeys.hasCompletedOnboarding, status);
}
