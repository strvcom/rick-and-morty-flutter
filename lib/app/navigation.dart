import 'dart:io';

import 'package:get/route_manager.dart';

import 'app_theme.dart';

class Navigation {
  static final pages = <GetPage>[];

  static Duration get platformPushDuration {
    return Platform.isAndroid ? AppTheme.fadeInAnimationDuration : AppTheme.cupertinoAnimationDuration;
  }

  static Transition get platformPushTransition {
    return Platform.isAndroid ? Transition.fadeIn : Transition.cupertino;
  }
}
