import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise.
  // Localizations are accessed using InheritedWidget "of" syntax.
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  // Where we load our list of translated strings
  Map<String, String> _localizedStrings;

  // Load the localizations
  Future<void> load() async {
    // Load the language JSON file from the 'lang' folder
    String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
    // jsonMap (i.e. result of decode) has to be to dynamic map (even though are actually all strings)
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    // re-map to create the strings we will use
    _localizedStrings = Map<String, String>.from(jsonMap);
    // // equivalent code
    // _localizedStrings = jsonMap.map((key, value) {
    //   return MapEntry(key, value.toString());
    // });
    return;
  }

  // Provide the localized/translated value. This will be called from each widget that needs localized text.
  // NOTE: When developing/debugging, the JSON files are not reloaded on hot reload.
  //       Therefore it is necessary to rebuild in order to pick up new translations.
  String translate(String key) {
    return _localizedStrings[key] ?? '*** MISSING LOCALIZATION: $key ***';
  }
}

// LocalizationsDelegate is a factory for a set of localized resources
// In this case, the localized strings will be gotten in an AppLocalizations object
class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!), so it can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return ['en', 'es', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
