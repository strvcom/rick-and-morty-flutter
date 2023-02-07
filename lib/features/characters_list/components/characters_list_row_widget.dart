import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:rick_and_morty/core/model/character.dart';

class CharacterListRowWidget extends StatelessWidget {
  final Character character;
  final VoidCallback? onTap;

  const CharacterListRowWidget({Key? key, required this.character, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: character.id,
            child: ExtendedImage.network(
              character.imageUrl,
              width: 110,
              height: 110,
              fit: BoxFit.fill,
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: textTheme.titleLarge,
                  ),
                  Text(
                    "${character.species} • ${character.gender}",
                    style: textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
