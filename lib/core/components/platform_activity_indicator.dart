import 'package:flutter/material.dart';

class PlatformActivityIndicator extends StatelessWidget {
  const PlatformActivityIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.secondary;

    return CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(color));
  }
}
