import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/core/model/pagination_info.dart';
import 'package:rick_and_morty/features/characters_list/data/get_characters_use_case.dart';
import 'package:rick_and_morty/features/characters_list/model/character_list_item.dart';

class CharacterListPageController extends GetxController with StateMixin {
  final _getCharactersUseCase = Get.find<GetCharactersUseCase>();
  final characters = <CharacterListItem>[].obs;
  PaginationInfo? _lastPage;

  @override
  Future<void> onInit() async {
    super.onInit();

    change(null, status: RxStatus.loading());

    await _loadCharacters();

    change(null, status: RxStatus.success());
  }

  Future<void> _loadCharacters() async {
    try {
      final result = await _getCharactersUseCase.get();

      _lastPage = result.info;

      characters.addAll(result.results.map((character) => CharacterListItem(character: character)));
    } catch (error) {
      change(null, status: RxStatus.error());
    }
  }

  Future<void> loadMoreCharacters() async {
    if (_lastPage == null) return;

    Fimber.i("Pain load more data");

    characters.add(CharacterListItem());

    final result = await _getCharactersUseCase.get(page: _lastPage?.nextPageNumber);

    _lastPage = result.info;

    characters.removeLast();
    characters.addAll(result.results.map((character) => CharacterListItem(character: character)));
  }
}
