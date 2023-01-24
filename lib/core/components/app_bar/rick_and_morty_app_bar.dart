import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/application/app_theme.dart';
import 'package:rick_and_morty/application/supported_platform.dart';
import 'package:rick_and_morty/core/components/platform_back_button.dart';

class RickAndMortyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;

  const RickAndMortyAppBar({
    Key? key,
    required this.title,
    this.leading,
  }) : super(key: key);

  RickAndMortyAppBar.backButtonBar({
    Key? key,
    required this.title,
    required VoidCallback onPressed,
  })  : leading = PlatformBackButton(onPressed: onPressed),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (CurrentPlatform.current) {
      case (SupportedPlatform.web):
      case (SupportedPlatform.android):
        return _materialAppBar(theme);
      case (SupportedPlatform.iOS):
      case (SupportedPlatform.macos):
        return _cupertinoNavigationBar(theme);
    }
  }

  @override
  Size get preferredSize {
    switch (CurrentPlatform.current) {
      case (SupportedPlatform.web):
      case (SupportedPlatform.android):
        return const Size.fromHeight(kToolbarHeight);
      case (SupportedPlatform.iOS):
      case (SupportedPlatform.macos):
        return const Size.fromHeight(kMinInteractiveDimensionCupertino);
    }
  }

  Widget _materialAppBar(ThemeData theme) {
    return AppBar(
      leading: leading,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: theme.textTheme.headlineSmall,
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }

  Widget _cupertinoNavigationBar(ThemeData theme) {
    return CupertinoNavigationBar(
      leading: leading,
      middle: Text(
        title,
        style: AppTheme.cupertinoNavigationBarTitleTextStyle(theme.colorScheme),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }
}
