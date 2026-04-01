import 'package:get/get.dart';

class DynamicAppSize {
  static double getScaledSize(
    double size,
  ) {
    double baseWidth = 390;
    double fem = Get.width / baseWidth;
    return fem * size;
  }
}
