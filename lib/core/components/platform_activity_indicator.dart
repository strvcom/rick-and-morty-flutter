import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  const PlatformActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    if (Platform.isAndroid) {
      return SizedBox(
        width: 36,
        height: 36,
        child: Center(child: CircularProgressIndicator(color: color)),
      );
    } else {
      return CupertinoActivityIndicator(color: color);
    }
  }
}
