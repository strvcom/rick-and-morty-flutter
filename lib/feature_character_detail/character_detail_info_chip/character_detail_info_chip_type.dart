import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/model/character.dart';

enum CharacterDetailInfoChipType { name, species, gender, origin, location }

extension CharacterDetailInfoChipTypeExtension on CharacterDetailInfoChipType {
  IconData get icon {
    switch (this) {
      case CharacterDetailInfoChipType.name:
        return Icons.wallet;
      case CharacterDetailInfoChipType.species:
        return Icons.groups;
      case CharacterDetailInfoChipType.gender:
        return Icons.male;
      case CharacterDetailInfoChipType.origin:
        return Icons.public;
      case CharacterDetailInfoChipType.location:
        return Icons.person_pin_circle;
    }
  }

  String title(Character character) {
    switch (this) {
      case CharacterDetailInfoChipType.name:
        return character.name;
      case CharacterDetailInfoChipType.species:
        return character.species;
      case CharacterDetailInfoChipType.gender:
        return character.gender;
      case CharacterDetailInfoChipType.origin:
        return character.origin.name;
      case CharacterDetailInfoChipType.location:
        return character.location.name;
    }
  }
}
