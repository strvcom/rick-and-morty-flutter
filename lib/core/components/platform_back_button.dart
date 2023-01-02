// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PlatformBackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    if (Platform.isIOS) {
      return CupertinoNavigationBarBackButton(
        color: color,
        onPressed: onPressed,
      );
    } else {
      return BackButton(
        color: color,
        onPressed: onPressed,
      );
    }
  }
}
