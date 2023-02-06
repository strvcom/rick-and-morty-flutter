import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/core/localization/app_locale.dart';

void showErrorSnackbar(
  Object? error,
  BuildContext context,
) {
  final theme = Theme.of(context);

  Get.showSnackbar(
    GetSnackBar(
      titleText: Text(
        AppLocaleKey.generalStateErrorSomethingWentWrong.tr,
        style: theme.textTheme.bodyMedium,
      ),
      messageText: Text(
        error.toString(),
        style: theme.textTheme.labelSmall,
      ),
      backgroundColor: theme.colorScheme.error,
      duration: const Duration(seconds: 5),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      snackPosition: SnackPosition.TOP,
    ),
  );
}
