 import 'package:base_nest/core/localization/supported_locales.dart';
import 'package:base_nest/core/utils/logger.dart';
import 'package:flutter/material.dart';

class LocalizationProvider with ChangeNotifier {
  Locale _locale;

  LocalizationProvider()
      : _locale = _resolveInitialLocale(WidgetsBinding.instance.platformDispatcher.locale);

  static Locale _resolveInitialLocale(Locale systemLocale) {
    LoggerService.info('System locale: ${systemLocale.languageCode}_${systemLocale.countryCode}');

    if (SupportedLocales.languageCodes.contains(systemLocale.languageCode)) {
      return Locale(systemLocale.languageCode);
    } else {
      return SupportedLocales.fallbackLocale;
    }
  }

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
