import 'package:flutter/material.dart';

class SupportedLocales {
  static const List<Locale> list = [
    Locale('en'),
    Locale('ar'),
    // Add more languages here later
  ];

  static List<String> get languageCodes => list.map((locale) => locale.languageCode).toList();

  static const Locale fallbackLocale = Locale('en'); // 🛡️ Add this
}
