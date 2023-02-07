import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/core/components/app_bar/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/core/localization/app_locale.dart';
import 'package:rick_and_morty/features/character_detail/character_detail_page_controller.dart';
import 'package:rick_and_morty/features/character_detail/components/character_detail_info_chip_type.dart';
import 'package:rick_and_morty/features/character_detail/components/character_detail_info_chip_widget.dart';

class CharacterDetailPage extends GetView<CharacterDetailPageController> {
  static const routeName = "/characterDetail";

  const CharacterDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RickAndMortyAppBar.backButtonBar(
        title: controller.character.name,
        onPressed: () => Get.back(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: controller.character.id,
              child: ExtendedImage.network(
                controller.character.imageUrl,
                fit: BoxFit.fill,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocaleKey.characterDetailInfo.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Wrap(
            direction: Axis.horizontal,
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.start,
            children: CharacterDetailInfoChipType.values
                .map((type) => CharacterDetailInfoChipWidget(character: controller.character, type: type))
                .toList(),
          ),
        ],
      ),
    );
  }
}
