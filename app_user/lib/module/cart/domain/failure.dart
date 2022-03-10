import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class CartFailure with _$CartFailure {
  const factory CartFailure.serverError() = _ServerError;
}
