import 'dart:io';

import 'package:get/route_manager.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_bindings.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_page.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_page_arguments.dart';
import 'package:rick_and_morty/features/characters_list/characters_list_bindings.dart';
import 'package:rick_and_morty/features/characters_list/characters_list_page.dart';

import 'app_theme.dart';

class Navigation {
  static final pages = [
    GetPage(
      name: CharactersListPage.routeName,
      page: () => const CharactersListPage(),
      binding: CharactersListBindings(),
      transition: Transition.fadeIn,
      transitionDuration: AppTheme.fadeInAnimationDuration,
    ),
    GetPage(
      name: CharacterDetailPage.routeName,
      page: () => const CharacterDetailPage(),
      binding: CharacterDetailBindings(),
      arguments: CharacterDetailPageArguments,
      transition: platformPushTransition,
      transitionDuration: platformPushDuration,
    )
  ];

  static Duration get platformPushDuration {
    return Platform.isAndroid ? AppTheme.fadeInAnimationDuration : AppTheme.cupertinoAnimationDuration;
  }

  static Transition get platformPushTransition {
    return Platform.isAndroid ? Transition.fadeIn : Transition.cupertino;
  }
}
