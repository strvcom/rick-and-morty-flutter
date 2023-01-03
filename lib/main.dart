import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:get/instance_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rick_and_morty/application/app_config.dart';
import 'package:rick_and_morty/application/rick_and_morty_app.dart';

void main() {
  _setupFimber();
  _setupDIO();

  runApp(const RickAndMortyApp());
}

void _setupFimber() {
  if (kDebugMode || kProfileMode) {
    Fimber.plantTree(
      CustomFormatTree(
        logFormat: "${CustomFormatTree.timeStampToken} | ${CustomFormatTree.messageToken}",
        useColors: true,
        logLevels: ["V", "D", "I", "W", "E"],
      ),
    );
  }
}

void _setupDIO() {
  var dio = Dio();
  dio.options.baseUrl = AppConfig.host;
  dio.interceptors.add(PrettyDioLogger());
  Get.put(dio, permanent: true);
}
