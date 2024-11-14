import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  final Map<String, String> _localizedStrings = {};

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  // Load specific screen's language file
  Future<bool> loadScreenLocalization(String screenName) async {
    // Check if the file is already loaded for the screen
    if (_localizedStrings.isEmpty) {
      final jsonString = await rootBundle.loadString('lib/l10n/${locale.languageCode}/$screenName.json');
      if (kDebugMode) {
        print('Loading JSON from: lib/l10n/${locale.languageCode}/$screenName.json');
      }

      final Map<String, dynamic> jsonMap = json.decode(jsonString);
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
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    //await localizations.loadScreenLocalization('home_screen');  // Default screen to load
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
