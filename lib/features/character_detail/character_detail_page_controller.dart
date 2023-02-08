import 'package:get/get.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_page_arguments.dart';

class CharacterDetailPageController extends GetxController {
  final character = (Get.arguments as CharacterDetailPageArguments).character;
}
