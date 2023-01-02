import 'package:rick_and_morty/core/model/location.dart';
import 'package:rick_and_morty/core/model/origin.dart';

class Character {
  final int id;
  final String name;
  final String species;
  final String type;
  final String gender;
  final String imageUrl;
  final Location location;
  final Origin origin;

  Character({
    required this.id,
    required this.name,
    required this.species,
    required this.type,
    required this.gender,
    required this.imageUrl,
    required this.location,
    required this.origin,
  });

  Character copyWith({
    int? id,
    String? name,
    String? species,
    String? type,
    String? gender,
    String? imageUrl,
    String? episodeUrls,
    Location? location,
    Origin? origin,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      species: species ?? this.species,
      type: type ?? this.type,
      gender: gender ?? this.gender,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location?.copyWith(name: location.name) ?? this.location,
      origin: origin?.copyWith(name: origin.name) ?? this.origin,
    );
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      species: map['species'] as String,
      type: map['type'] as String,
      gender: map['gender'] as String,
      imageUrl: map['image'] as String,
      location: Location.fromMap(map['location']),
      origin: Origin.fromMap(map['origin']),
    );
  }

  @override
  String toString() {
    return 'Character(id: $id, name: $name, species: $species, type: $type, gender: $gender, imageUrl: $imageUrl, location: $location, origin: $origin)';
  }

  @override
  bool operator ==(covariant Character other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.species == species &&
        other.type == type &&
        other.gender == gender &&
        other.imageUrl == imageUrl &&
        other.location == location &&
        other.origin == origin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        species.hashCode ^
        type.hashCode ^
        gender.hashCode ^
        location.hashCode ^
        origin.hashCode;
  }
}
