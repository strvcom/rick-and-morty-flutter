import 'dart:io';
import 'package:flutter/foundation.dart';

enum SupportedPlatform {
  android,
  iOS,
  web,
}

extension CurrentPlatform on SupportedPlatform {
  static SupportedPlatform get current {
    if (kIsWeb) {
      return SupportedPlatform.web;
    } else if (Platform.isAndroid) {
      return SupportedPlatform.android;
    } else if (Platform.isIOS) {
      return SupportedPlatform.iOS;
    } else {
      throw Exception("Trying to build project on not supported platform");
    }
  }
}
