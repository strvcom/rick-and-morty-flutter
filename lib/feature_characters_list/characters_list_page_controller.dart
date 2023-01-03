import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/application/app_config.dart';
import 'package:rick_and_morty/core/model/characters_response.dart';
import 'package:rick_and_morty/core/model/pagination_info.dart';
import 'package:rick_and_morty/feature_characters_list/character_list_item.dart';

class CharacterListPageController extends GetxController with StateMixin {
  final characters = <CharacterListItem>[].obs;
  PaginationInfo? _lastPage;

  bool get _isLoadingMoreCharacters {
    if (characters.isEmpty) return false;

    return characters.last.isLoding;
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    change(null, status: RxStatus.loading());

    await _loadCharacters();

    change(null, status: RxStatus.success());
  }

  Future<void> loadMoreCharacters() async {
    if (_lastPage == null || _isLoadingMoreCharacters) return;

    characters.add(CharacterListItem());

    final dio = Get.find<Dio>();

    final data = await dio.get(
      '${AppConfig.characterPath}/',
      queryParameters: {'page': _lastPage?.nextPageNumber},
    );

    final result = CharactersResponse.fromMap(data.data);

    _lastPage = result.info;

    characters.removeLast();
    characters.addAll(result.results.map((character) => CharacterListItem(character: character)));
  }

  Future<void> _loadCharacters() async {
    final dio = Get.find<Dio>();

    try {
      final data = await dio.get(AppConfig.characterPath);

      final result = CharactersResponse.fromMap(data.data);

      _lastPage = result.info;

      characters.addAll(result.results.map((character) => CharacterListItem(character: character)));
    } catch (error) {
      change(null, status: RxStatus.error());
    }
  }
}
