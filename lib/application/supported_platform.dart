import 'dart:io';
import 'package:flutter/foundation.dart';

enum SupportedPlatform {
  android,
  iOS,
  web,
}

extension CurrentPlatform on SupportedPlatform {
  static SupportedPlatform get current {
    /// If we tried to access `Platform` enum on web, we get an exception, hence, we
    /// need to ask if app is runnin on web and after that, we can access `Platform`
    /// safely.
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
