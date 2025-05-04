import 'package:flutter/material.dart';

String formatTimeTo24Hour(String backendTime) {
  if (backendTime.isEmpty) return "";

  // Convert any Arabic digits to English first
  backendTime = convertToEnglishDigits(backendTime);

  // Strip AM/PM if present
  backendTime =
      backendTime.replaceAll(RegExp(r'\s?(AM|PM)', caseSensitive: false), '');

  // Split time into parts
  final parts = backendTime.split(':');
  if (parts.length < 2) return backendTime;

  int hour = int.tryParse(parts[0].trim()) ?? 0;
  int minute = int.tryParse(parts[1].trim()) ?? 0;
  String period = hour > 12 ? 'PM' : 'AM';

  final paddedHour = hour.toString().padLeft(2, '0');
  final paddedMinute = minute.toString().padLeft(2, '0');

  return '$paddedHour:$paddedMinute $period';
}

String convertToEnglishDigits(String input) {
  const arabicToEnglish = {
    '٠': '0',
    '١': '1',
    '٢': '2',
    '٣': '3',
    '٤': '4',
    '٥': '5',
    '٦': '6',
    '٧': '7',
    '٨': '8',
    '٩': '9',
  };

  arabicToEnglish.forEach((key, value) {
    input = input.replaceAll(key, value);
  });

  return input;
}

TimeOfDay parse24HourTime(String time) {
  try {
    time = convertToEnglishDigits(time);
    time =
        time.replaceAll(RegExp(r'\s?(AM|PM)', caseSensitive: false), '').trim();

    final parts = time.split(':');
    if (parts.length != 2) throw FormatException("Invalid time format");

    final hour = int.parse(parts[0].trim()).clamp(0, 23);
    final minute = int.parse(parts[1].trim()).clamp(0, 59);

    return TimeOfDay(hour: hour, minute: minute);
  } catch (e) {
    debugPrint('Failed to parse 24-hour time: $time — $e');
    return TimeOfDay.now();
  }
}
