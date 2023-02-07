import 'package:rick_and_morty/core/model/character.dart';

class CharacterListItem {
  final Character? character;

  CharacterListItem({
    this.character,
  });

  bool get isLoding {
    return character == null;
  }

  CharacterListItem copyWith({
    Character? character,
  }) {
    return CharacterListItem(
      character: character ?? this.character,
    );
  }

  @override
  String toString() => 'CharacterListItem(character: $character)';

  @override
  bool operator ==(covariant CharacterListItem other) {
    if (identical(this, other)) return true;

    return other.character == character;
  }

  @override
  int get hashCode => character.hashCode;
}
