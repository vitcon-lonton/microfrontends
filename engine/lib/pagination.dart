import 'package:flutter/foundation.dart';

class Pagination<T> {
  final int page;
  final int perPage;
  final int pageCount;
  final int totalCount;
  final List<T> data;

  Pagination({
    required this.page,
    required this.perPage,
    required this.pageCount,
    required this.totalCount,
    required this.data,
  });

  Pagination<T> copyWith({
    int? page,
    int? perPage,
    int? pageCount,
    int? totalCount,
    List<T>? data,
  }) {
    return Pagination<T>(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      pageCount: pageCount ?? this.pageCount,
      totalCount: totalCount ?? this.totalCount,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'Pagination(page: $page, perPage: $perPage, pageCount: $pageCount, totalCount: $totalCount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pagination<T> &&
        other.page == page &&
        other.perPage == perPage &&
        other.pageCount == pageCount &&
        other.totalCount == totalCount &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode {
    return page.hashCode ^
        perPage.hashCode ^
        pageCount.hashCode ^
        totalCount.hashCode ^
        data.hashCode;
  }
}
