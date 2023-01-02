import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rick_and_morty/application/app_theme.dart';
import 'package:rick_and_morty/core/localization/app_locale.dart';
import 'package:rick_and_morty/feature_characters_list/characters_list_page.dart';

import 'navigation.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocale();

    locale.validate();

    return GetMaterialApp(
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      themeMode: ThemeMode.system,
      translations: locale,
      locale: Get.deviceLocale,
      fallbackLocale: Locale(SupportedLocale.en.key),
      initialRoute: CharactersListPage.routeName,
      getPages: Navigation.pages,
    );
  }
}
