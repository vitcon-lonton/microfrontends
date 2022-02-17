import 'package:engine/engine.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entities.freezed.dart';

@freezed
class Service with _$Service {
  const factory Service({required String name}) = _Service;
}

@freezed
class Category with _$Category {
  const factory Category({required String name}) = _Category;
}
