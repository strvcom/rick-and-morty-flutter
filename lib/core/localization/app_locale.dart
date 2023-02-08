library app_locale;

import 'package:get/get.dart';

part 'package:rick_and_morty/core/localization/app_locale_key.dart';
part 'package:rick_and_morty/core/localization/en_locale.dart';
part 'package:rick_and_morty/core/localization/supported_locale.dart';

class AppLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {SupportedLocale.en.key: _enKeys};

  /// Controls if [keys] contains value for all supported languages.
  validate() {
    for (final supportedLocale in SupportedLocale.values) {
      final localeKeys = keys[supportedLocale.key];

      if (localeKeys == null) {
        throw Exception('Locale ${supportedLocale.key} is not found in \'keys\'');
      }

      for (final appLocaleKey in AppLocaleKey.values) {
        if (localeKeys[appLocaleKey.key] == null) {
          throw Exception('Key ${appLocaleKey.key} is not found in ${supportedLocale.key} locale');
        }
      }
    }
  }
}
