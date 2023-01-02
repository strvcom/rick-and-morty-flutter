part of app_locale;

enum AppLocaleKey {
  // General
  generalStateLoading,
  generalStateErrorSomethingWentWrong,

  // Characters
  charactersTitle,

  // Character detail
  characterDetailInfo
}

extension AppLocaleKeyExtension on AppLocaleKey {
  String get key => toString();

  String get tr => key.tr;
}
