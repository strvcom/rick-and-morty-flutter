// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/assets/fonts.dart';
import 'package:rick_and_morty/core/assets/pallete.dart';

class RickAndMortySliverAppBar extends StatelessWidget {
  final String title;

  const RickAndMortySliverAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (Platform.isIOS) {
      return CupertinoSliverNavigationBar(
        automaticallyImplyLeading: false,
        largeTitle: Text(
          title,
          style: TextStyle(
            fontFamily: Fonts.clashDisplay,
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.brightness == Brightness.dark ? Pallete.white : Pallete.black,
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
      );
    } else {
      return SliverAppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: theme.textTheme.headlineSmall,
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        pinned: true,
      );
    }
  }
}
