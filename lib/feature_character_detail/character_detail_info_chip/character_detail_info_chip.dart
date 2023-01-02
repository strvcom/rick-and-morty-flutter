// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rick_and_morty/feature_character_detail/character_detail_info_chip/character_detail_info_chip_type.dart';
import 'package:rick_and_morty/core/model/character.dart';

import '../../core/assets/pallete.dart';

class CharacterDetailInfoChip extends StatelessWidget {
  final Character character;
  final CharacterDetailInfoChipType type;

  const CharacterDetailInfoChip({
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
