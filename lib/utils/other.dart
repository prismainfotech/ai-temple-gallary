import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

bool isDigitsOnly(String? s) {
  if (s == null) {
    return false;
  }
  final cleaned = s.replaceAll(' ', '');
  return int.tryParse(cleaned) != null;
}

bool equalsIgnoreCase(String? string1, String? string2) {
  return string1?.toLowerCase() == string2?.toLowerCase();
}

String formatFullName(String? firstName, String? lastName) {
  String trimmedFirstName = firstName?.trim() ?? '';
  String trimmedLastName = lastName?.trim() ?? '';

  if (trimmedFirstName.isNotEmpty && trimmedLastName.isNotEmpty) {
    return '$trimmedFirstName $trimmedLastName';
  }

  if (trimmedFirstName.isNotEmpty) {
    return trimmedFirstName;
  }
  if (trimmedLastName.isNotEmpty) {
    return trimmedLastName;
  }

  return '';
}

String formatManufacturerName(String manufacturerName, {int maxLength = 5}) {
  if (manufacturerName.isNotEmpty && manufacturerName.length > maxLength) {
    return manufacturerName.substring(0, maxLength).toUpperCase();
  } else {
    return (manufacturerName.isEmpty ? "-" : manufacturerName).toUpperCase();
  }
}

int stripWiseShowQtyFromSettings(String? sellingUnit, int? qty, int? size) {
  if (sellingUnit == "strip") {
    if (qty == 0 || qty == null) {
      return 0;
    } else {
      try {
        return qty ~/ (size ?? 1);
      } catch (e) {
        return 0;
      }
    }
  } else {
    return qty ?? 0;
  }
}

int allTimeStripWiseQty(int? qty, int? size) {
  if (qty == 0 || qty == null) {
    return 0;
  } else {
    return qty ~/ (size ?? 1);
  }
}

Future<void> exploreUrl(Uri url) async {
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Oops! We can't open this page.");
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

bool containWords(String inputString, List<String> wordList) {
  for (String word in wordList) {
    if (inputString.toLowerCase().contains(word.toLowerCase())) {
      return true;
    }
  }
  return false;
}

extension StringExtension on String? {
  String capitalize() {
    if (this == null || this!.isEmpty) {
      return "";
    }
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  String removeUnderscoresAndCapitalize() {
    if (this == null || this!.isEmpty) {
      return "";
    }

    List<String> words = this!.split('_');

    for (int index = 0; index < words.length; index++) {
      if (words[index].isNotEmpty) {
        words[index] = words[index][0].toUpperCase() + words[index].substring(1).toLowerCase();
      }
    }

    return words.join(' ');
  }

  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  String dashIfNullOrEmpty() {
    if (this == null || this!.isEmpty) {
      return "-";
    }
    return "$this";
  }

  String removeSpaceWithUnderScore() {
    if (this == null || this!.isEmpty) {
      return "";
    }
    return this!.replaceAll(" ", "_");
  }
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

bool isValidPercentage(String text) {
  final number = double.tryParse(text);
  return number != null && number >= 0 && number <= 100;
}

extension TextEditingControllerExt on TextEditingController {
  void selectAll() {
    if (text.isEmpty) return;
    selection = TextSelection(baseOffset: 0, extentOffset: text.length);
  }
}

double calculatePercentageAmount(double value, double discountPercentage) {
  if (value == 0.0 || discountPercentage == 0.0) {
    return 0.0;
  }
  return (value * discountPercentage) / 100;
}

double getFileSizeInMB(int sizeInBytes, {int decimals = 2}) {
  double sizeInMB = sizeInBytes / (1024 * 1024);
  return double.parse(sizeInMB.toStringAsFixed(decimals));
}

int calculateTokenNumber(int? table, int? index) {
  if (table != null && table >= 0) {
    return table + 1;
  }
  return (index ?? 0) + 1;
}

String formatDate(String? dateStr) {
  if (dateStr == null || dateStr.isEmpty) return '';
  try {
    final date = DateTime.parse(dateStr).toLocal();
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
  } catch (e) {
    return '';
  }
}
