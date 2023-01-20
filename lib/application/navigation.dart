import 'package:get/route_manager.dart';
import 'package:rick_and_morty/application/supported_platform.dart';
import 'package:rick_and_morty/feature_character_detail/character_detail_page.dart';
import 'package:rick_and_morty/feature_character_detail/character_detail_page_arguments.dart';
import 'package:rick_and_morty/feature_characters_list/characters_list_bindings.dart';
import 'package:rick_and_morty/feature_characters_list/characters_list_page.dart';

import 'app_theme.dart';

class Navigation {
  static final pages = [
    GetPage(
      name: CharactersListPage.routeName,
      page: () => const CharactersListPage(),
      transition: Transition.fadeIn,
      transitionDuration: AppTheme.fadeInAnimationDuration,
      binding: CharactersListBindings(),
    ),
    GetPage(
      name: CharacterDetailPage.routeName,
      page: () => const CharacterDetailPage(),
      arguments: CharacterDetailPageArguments,
      transition: platformPushTransition,
      transitionDuration: platformPushDuration,
    )
  ];

  static Duration get platformPushDuration {
    switch (CurrentPlatform.current) {
      case (SupportedPlatform.web):
      case (SupportedPlatform.android):
        return AppTheme.fadeInAnimationDuration;
      case (SupportedPlatform.iOS):
        return AppTheme.cupertinoAnimationDuration;
    }
  }

  static Transition get platformPushTransition {
    switch (CurrentPlatform.current) {
      case (SupportedPlatform.web):
      case (SupportedPlatform.android):
        return Transition.fadeIn;
      case (SupportedPlatform.iOS):
        return Transition.cupertino;
    }
  }
}
