import 'package:intl/intl.dart';

String formatPostTime(String utcTimeString) {
  String utcString = utcTimeString;

  // print('=== Testing Timezone Conversion ===');
  // print('Original UTC: $utcString');

  // Check current device timezone
  DateTime now = DateTime.now();
  DateTime utcNow = now.toUtc();
  // print('Current local time: $now');
  // print('Current UTC time: $utcNow');
  // print('Timezone: ${now.timeZoneName}');
  // print('Offset: ${now.timeZoneOffset}');

  // Parse and convert
  try {
    DateTime utcDate = DateTime.parse(utcString + 'Z'); // Add Z to ensure UTC
    DateTime localDate = utcDate.toLocal();

    // print('Parsed UTC: $utcDate');
    // print('Converted Local: $localDate');
    // print('Difference: ${localDate.difference(utcDate)}');
    // Format the local date
    return DateFormat('MMM dd, yyyy "at" hh:mm a').format(localDate).toString();
  } catch (e) {
    print('Error: $e');
    return 'Invalid date format';
  }
}
