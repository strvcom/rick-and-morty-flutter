part of app_locale;

enum SupportedLocale { en }

extension SupportedLocaleExtension on SupportedLocale {
  String get key => toString();

  String get fallback => SupportedLocale.en.key;
}
