import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_failure.freezed.dart';

@freezed
class CartFailure with _$CartFailure {
  const factory CartFailure.unexpected() = _Unexpected;
  const factory CartFailure.unableCreate() = _UnableCreate;
  const factory CartFailure.unableDelete() = _UnableDelete;
  const factory CartFailure.unableUpdate() = _UnableUpdate;
}
