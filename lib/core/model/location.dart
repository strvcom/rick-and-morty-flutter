class Location {
  final String name;
  Location({
    required this.name,
  });

  Location copyWith({
    String? name,
  }) {
    return Location(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] as String,
    );
  }

  @override
  String toString() => 'Location(name: $name)';

  @override
  bool operator ==(covariant Location other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
