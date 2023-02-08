import 'package:get/instance_manager.dart';
import 'package:rick_and_morty/features/characters_list/characters_list_page_controller.dart';
import 'package:rick_and_morty/features/characters_list/data/get_characters_use_case.dart';

class CharactersListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetCharactersUseCase>(() => GetCharactersUseCaseImp());
    Get.lazyPut(() => CharacterListPageController());
  }
}
