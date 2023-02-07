import 'package:get/instance_manager.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_page_controller.dart';

class CharacterDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CharacterDetailPageController());
  }
}
