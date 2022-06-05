import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../translations/en_US.dart';
import '../translations/bn_BD.dart';
import 'app_credentials.dart';

class LocalizationService extends Translations {
  static const locale = Locale('en', 'US');
  static const fallBackLocale = Locale('bn', 'BD');

  static final languages = [
    englishLanguage,
    bengaliLanguage,
  ];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('bn', 'BD'),
  ];

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'bn_BD': bn,
      };

  void changeLocale(String language) {
    final locale = _getLocaleFromLanguage(language);
    Get.updateLocale(locale);
  }

  Locale _getLocaleFromLanguage(String language) {

    for (int i = 0; i < languages.length; i++) {
      if (language == languages[i]) {
        return locales[i];
      }
    }
    return Get.locale!;
  }
}
