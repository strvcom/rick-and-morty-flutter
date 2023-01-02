class Origin {
  final String name;

  Origin({
    required this.name,
  });

  Origin copyWith({
    String? name,
  }) {
    return Origin(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      name: map['name'] as String,
    );
  }

  @override
  String toString() => 'Origin(name: $name)';

  @override
  bool operator ==(covariant Origin other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
