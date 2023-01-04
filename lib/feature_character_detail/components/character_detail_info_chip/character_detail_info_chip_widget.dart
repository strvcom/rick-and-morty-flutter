import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/assets/pallete.dart';
import 'package:rick_and_morty/feature_character_detail/components/character_detail_info_chip/character_detail_info_chip_type.dart';
import 'package:rick_and_morty/core/model/character.dart';

class CharacterDetailInfoChipWidget extends StatelessWidget {
  final Character character;
  final CharacterDetailInfoChipType type;

  const CharacterDetailInfoChipWidget({
    Key? key,
    required this.character,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          type.icon,
          color: Pallete.textBody,
        ),
        const SizedBox(width: 8),
        Text(
          type.title(character),
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
