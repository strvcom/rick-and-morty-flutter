import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/components/platform_activity_indicator.dart';

import '../localization/app_locale.dart';

class RickAndMortyLoadingIndicator extends StatelessWidget {
  const RickAndMortyLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PlatformActivityIndicator(),
          const SizedBox(height: 8),
          Text(
            AppLocaleKey.generalStateLoading.tr,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
