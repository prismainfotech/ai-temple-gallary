import 'package:intl/intl.dart';
import 'other.dart';

// method to check if zero || null and "" then show "0"
String zeroIfIntNullOrEmpty(dynamic value) {
  if (value == null || value == 0 || value == '') {
    return '0';
  }
  return value.toString();
}

double amountParseToDecimalDouble(dynamic str, {int decimalPlaces = 2}) {
  if (str is String) {
    if (str.isNullOrEmpty()) {
      return 0;
    }
    str = double.parse(str);
  }
  // Dynamically construct the format string based on the decimal count
  String formatPattern = "##0.${'0' * decimalPlaces}";

  return double.parse(NumberFormat(formatPattern).format(str ?? 0.0));
}

String amountFormatToIntString(dynamic str) {
  if (str is double) {
    str = str.round();
  }

  if (str is String) {
    if (str.isNullOrEmpty()) {
      return "0";
    }
    str = int.parse(str);
  }
  return NumberFormat("##,##,##0").format(str ?? 0);
}

int amountParseToInt(dynamic str) {
  if (str == null) {
    return 0;
  }

  if (str is double) {
    return str.round();
  }

  if (str is String) {
    if (str.isNullOrEmpty()) {
      return 0;
    }
  }
  return int.parse("$str");
}

String doubleToDecimal(dynamic value) {
  if (value is String) {
    if (value.isNullOrEmpty()) {
      return "0";
    }
    value = double.parse(value);
  }

  if (value is double) {
    if (value <= 0) {
      return "0";
    }

    return NumberFormat("0.##").format(value);
  }

  return "0";
}

String numberFormatDouble(double value) {
  // don't change this condition
  if (value == 0 || value.isNaN || value.isInfinite) {
    return "0";
  }

  if (value == value.toInt().toDouble()) {
    return value.toInt().toString();
  } else {
    return value.toStringAsFixed(2);
  }
}
