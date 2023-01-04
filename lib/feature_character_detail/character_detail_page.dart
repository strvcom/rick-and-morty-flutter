// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rick_and_morty/core/components/app_bar/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/core/localization/app_locale.dart';
import 'package:rick_and_morty/feature_character_detail/components/character_detail_info_chip/character_detail_info_chip_widget.dart';
import 'package:rick_and_morty/feature_character_detail/components/character_detail_info_chip/character_detail_info_chip_type.dart';
import 'package:rick_and_morty/feature_character_detail/character_detail_page_arguments.dart';

class CharacterDetailPage extends StatelessWidget {
  static const routeName = "/characterDetail";

  final CharacterDetailPageArguments? arguments;

  const CharacterDetailPage({
    Key? key,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final character = arguments?.character ?? (Get.arguments as CharacterDetailPageArguments).character;

    return Scaffold(
      appBar: RickAndMortyAppBar.backButtonBar(
        title: character.name,
        onPressed: () => Get.back(),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            width: double.infinity,
            child: Hero(
              tag: character.id,
              child: ExtendedImage.network(
                character.imageUrl,
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
                .map((type) => CharacterDetailInfoChipWidget(character: character, type: type))
                .toList(),
          ),
        ],
      ),
    );
  }
}
