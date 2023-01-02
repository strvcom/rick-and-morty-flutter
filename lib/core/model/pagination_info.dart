class PaginationInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  String? get nextPageNumber {
    if (next == null) return null;

    RegExp regex = RegExp(r'\d+');

    final match = regex.firstMatch(next ?? "");

    if (match == null) return null;

    return match.group(0);
  }

  PaginationInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  PaginationInfo copyWith({
    int? count,
    int? pages,
    String? next,
    String? prev,
  }) {
    return PaginationInfo(
      count: count ?? this.count,
      pages: pages ?? this.pages,
      next: next ?? this.next,
      prev: prev ?? this.prev,
    );
  }

  factory PaginationInfo.fromMap(Map<String, dynamic> map) {
    return PaginationInfo(
      count: map['count'] as int,
      pages: map['pages'] as int,
      next: map['next'] != null ? map['next'] as String : null,
      prev: map['prev'] != null ? map['prev'] as String : null,
    );
  }

  @override
  String toString() {
    return 'PaginationInfo(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(covariant PaginationInfo other) {
    if (identical(this, other)) return true;

    return other.count == count && other.pages == pages && other.next == next && other.prev == prev;
  }

  @override
  int get hashCode {
    return count.hashCode ^ pages.hashCode ^ next.hashCode ^ prev.hashCode;
  }
}
