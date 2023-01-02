import 'package:flutter/foundation.dart';

import 'package:rick_and_morty/core/model/character.dart';
import 'package:rick_and_morty/core/model/pagination_info.dart';

class CharactersResponse {
  PaginationInfo info;
  List<Character> results;

  CharactersResponse({
    required this.info,
    required this.results,
  });

  CharactersResponse copyWith({
    PaginationInfo? info,
    List<Character>? results,
  }) {
    return CharactersResponse(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }

  factory CharactersResponse.fromMap(Map<String, dynamic> map) {
    return CharactersResponse(
      info: PaginationInfo.fromMap(map['info'] as Map<String, dynamic>),
      results: List<Character>.from(
        (map['results'] as List<dynamic>).map<Character>(
          (x) => Character.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() => 'CharactersResponse(info: $info, results: $results)';

  @override
  bool operator ==(covariant CharactersResponse other) {
    if (identical(this, other)) return true;

    return other.info == info && listEquals(other.results, results);
  }

  @override
  int get hashCode => info.hashCode ^ results.hashCode;
}
