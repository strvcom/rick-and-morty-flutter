import 'package:get/instance_manager.dart';
import 'package:rick_and_morty/feature_characters_list/characters_list_page_controller.dart';

class CharactersListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharacterListPageController());
  }
}
