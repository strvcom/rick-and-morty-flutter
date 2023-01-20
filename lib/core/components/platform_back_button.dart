// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/application/supported_platform.dart';

class PlatformBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlatformBackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    switch (CurrentPlatform.current) {
      case (SupportedPlatform.web):
      case (SupportedPlatform.android):
        return BackButton(
          color: color,
          onPressed: onPressed,
        );
      case (SupportedPlatform.iOS):
        return CupertinoNavigationBarBackButton(
          color: color,
          onPressed: onPressed,
        );
    }
  }
}
