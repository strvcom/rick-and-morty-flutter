import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/application/app_config.dart';
import 'package:rick_and_morty/core/model/characters_response.dart';

abstract class GetCharactersUseCase {
  Future<CharactersResponse> get({String? page});
}

class GetCharactersUseCaseImp extends GetCharactersUseCase {
  final _dio = Get.find<Dio>();

  @override
  Future<CharactersResponse> get({String? page}) async {
    final data = await _dio.get(
      '${AppConfig.characterPath}/',
      queryParameters: {'page': page},
    );

    return CharactersResponse.fromMap(data.data);
  }
}
