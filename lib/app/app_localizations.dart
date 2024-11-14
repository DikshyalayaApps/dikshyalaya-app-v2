import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    // List of screens to load translations for
    List<String> screens = ['home_screen', 'settings_screen', 'other_screen'];

    for (String screen in screens) {
      // Load each screen-specific JSON file based on locale
      final jsonString = await rootBundle.loadString('lib/l10n/${locale.languageCode}/$screen.json');
      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      // Merge the key-value pairs from each screen file into _localizedStrings
      _localizedStrings.addAll(jsonMap.map((key, value) => MapEntry(key, value.toString())));
    }

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
