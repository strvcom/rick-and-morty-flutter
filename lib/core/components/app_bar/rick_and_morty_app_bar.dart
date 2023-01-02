// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/application/app_theme.dart';
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

    if (Platform.isIOS) {
      return CupertinoNavigationBar(
        leading: leading,
        middle: Text(
          title,
          style: AppTheme.cupertinoNavigationBarTitleTextStyle(theme.colorScheme),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
      );
    } else {
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
  }

  @override
  Size get preferredSize => Size.fromHeight(Platform.isIOS ? kMinInteractiveDimensionCupertino : kToolbarHeight);
}
