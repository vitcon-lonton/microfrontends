import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class FavoriteFailure with _$FavoriteFailure {
  const factory FavoriteFailure.serverError() = _ServerError;
}
