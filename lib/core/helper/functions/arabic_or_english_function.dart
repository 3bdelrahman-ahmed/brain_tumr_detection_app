import 'package:flutter/material.dart';

TextDirection getTextDirection(String text) {
  final arabicRegExp = RegExp(r'[\u0600-\u06FF]');
  final hasArabic = arabicRegExp.hasMatch(text);
  return hasArabic ? TextDirection.rtl : TextDirection.ltr;
}
