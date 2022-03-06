// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CartStateTearOff {
  const _$CartStateTearOff();

  _CartState call(
      {UniqueId? removingId,
      bool isAdding = false,
      bool isLoading = false,
      bool isRemoving = false,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<List<CartItem>> itemsOption,
      required Option<Either<BookingFailure, Unit>> addFailureOrSuccessOption,
      required Option<Either<BookingFailure, Unit>>
          removeFailureOrSuccessOption,
      required Option<Either<BookingFailure, Unit>>
          submitFailureOrSuccessOption}) {
    return _CartState(
      removingId: removingId,
      isAdding: isAdding,
      isLoading: isLoading,
      isRemoving: isRemoving,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      itemsOption: itemsOption,
      addFailureOrSuccessOption: addFailureOrSuccessOption,
      removeFailureOrSuccessOption: removeFailureOrSuccessOption,
      submitFailureOrSuccessOption: submitFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $CartState = _$CartStateTearOff();

/// @nodoc
mixin _$CartState {
  UniqueId? get removingId => throw _privateConstructorUsedError;
  bool get isAdding => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRemoving => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<List<CartItem>> get itemsOption => throw _privateConstructorUsedError;
  Option<Either<BookingFailure, Unit>> get addFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<BookingFailure, Unit>> get removeFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  Option<Either<BookingFailure, Unit>> get submitFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call(
      {UniqueId? removingId,
      bool isAdding,
      bool isLoading,
      bool isRemoving,
      bool isSubmitting,
      bool showErrorMessages,
      Option<List<CartItem>> itemsOption,
      Option<Either<BookingFailure, Unit>> addFailureOrSuccessOption,
      Option<Either<BookingFailure, Unit>> removeFailureOrSuccessOption,
      Option<Either<BookingFailure, Unit>> submitFailureOrSuccessOption});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;

  @override
  $Res call({
    Object? removingId = freezed,
    Object? isAdding = freezed,
    Object? isLoading = freezed,
    Object? isRemoving = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? itemsOption = freezed,
    Object? addFailureOrSuccessOption = freezed,
    Object? removeFailureOrSuccessOption = freezed,
    Object? submitFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      removingId: removingId == freezed
          ? _value.removingId
          : removingId // ignore: cast_nullable_to_non_nullable
              as UniqueId?,
      isAdding: isAdding == freezed
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRemoving: isRemoving == freezed
          ? _value.isRemoving
          : isRemoving // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      itemsOption: itemsOption == freezed
          ? _value.itemsOption
          : itemsOption // ignore: cast_nullable_to_non_nullable
              as Option<List<CartItem>>,
      addFailureOrSuccessOption: addFailureOrSuccessOption == freezed
          ? _value.addFailureOrSuccessOption
          : addFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
      removeFailureOrSuccessOption: removeFailureOrSuccessOption == freezed
          ? _value.removeFailureOrSuccessOption
          : removeFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
      submitFailureOrSuccessOption: submitFailureOrSuccessOption == freezed
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(
          _CartState value, $Res Function(_CartState) then) =
      __$CartStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId? removingId,
      bool isAdding,
      bool isLoading,
      bool isRemoving,
      bool isSubmitting,
      bool showErrorMessages,
      Option<List<CartItem>> itemsOption,
      Option<Either<BookingFailure, Unit>> addFailureOrSuccessOption,
      Option<Either<BookingFailure, Unit>> removeFailureOrSuccessOption,
      Option<Either<BookingFailure, Unit>> submitFailureOrSuccessOption});
}

/// @nodoc
class __$CartStateCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(_CartState _value, $Res Function(_CartState) _then)
      : super(_value, (v) => _then(v as _CartState));

  @override
  _CartState get _value => super._value as _CartState;

  @override
  $Res call({
    Object? removingId = freezed,
    Object? isAdding = freezed,
    Object? isLoading = freezed,
    Object? isRemoving = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? itemsOption = freezed,
    Object? addFailureOrSuccessOption = freezed,
    Object? removeFailureOrSuccessOption = freezed,
    Object? submitFailureOrSuccessOption = freezed,
  }) {
    return _then(_CartState(
      removingId: removingId == freezed
          ? _value.removingId
          : removingId // ignore: cast_nullable_to_non_nullable
              as UniqueId?,
      isAdding: isAdding == freezed
          ? _value.isAdding
          : isAdding // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRemoving: isRemoving == freezed
          ? _value.isRemoving
          : isRemoving // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      itemsOption: itemsOption == freezed
          ? _value.itemsOption
          : itemsOption // ignore: cast_nullable_to_non_nullable
              as Option<List<CartItem>>,
      addFailureOrSuccessOption: addFailureOrSuccessOption == freezed
          ? _value.addFailureOrSuccessOption
          : addFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
      removeFailureOrSuccessOption: removeFailureOrSuccessOption == freezed
          ? _value.removeFailureOrSuccessOption
          : removeFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
      submitFailureOrSuccessOption: submitFailureOrSuccessOption == freezed
          ? _value.submitFailureOrSuccessOption
          : submitFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_CartState extends _CartState {
  _$_CartState(
      {this.removingId,
      this.isAdding = false,
      this.isLoading = false,
      this.isRemoving = false,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.itemsOption,
      required this.addFailureOrSuccessOption,
      required this.removeFailureOrSuccessOption,
      required this.submitFailureOrSuccessOption})
      : super._();

  @override
  final UniqueId? removingId;
  @JsonKey()
  @override
  final bool isAdding;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool isRemoving;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @override
  final Option<List<CartItem>> itemsOption;
  @override
  final Option<Either<BookingFailure, Unit>> addFailureOrSuccessOption;
  @override
  final Option<Either<BookingFailure, Unit>> removeFailureOrSuccessOption;
  @override
  final Option<Either<BookingFailure, Unit>> submitFailureOrSuccessOption;

  @override
  String toString() {
    return 'CartState(removingId: $removingId, isAdding: $isAdding, isLoading: $isLoading, isRemoving: $isRemoving, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, itemsOption: $itemsOption, addFailureOrSuccessOption: $addFailureOrSuccessOption, removeFailureOrSuccessOption: $removeFailureOrSuccessOption, submitFailureOrSuccessOption: $submitFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartState &&
            const DeepCollectionEquality()
                .equals(other.removingId, removingId) &&
            const DeepCollectionEquality().equals(other.isAdding, isAdding) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isRemoving, isRemoving) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.itemsOption, itemsOption) &&
            const DeepCollectionEquality().equals(
                other.addFailureOrSuccessOption, addFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(
                other.removeFailureOrSuccessOption,
                removeFailureOrSuccessOption) &&
            const DeepCollectionEquality().equals(
                other.submitFailureOrSuccessOption,
                submitFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(removingId),
      const DeepCollectionEquality().hash(isAdding),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isRemoving),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(itemsOption),
      const DeepCollectionEquality().hash(addFailureOrSuccessOption),
      const DeepCollectionEquality().hash(removeFailureOrSuccessOption),
      const DeepCollectionEquality().hash(submitFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$CartStateCopyWith<_CartState> get copyWith =>
      __$CartStateCopyWithImpl<_CartState>(this, _$identity);
}

abstract class _CartState extends CartState {
  factory _CartState(
      {UniqueId? removingId,
      bool isAdding,
      bool isLoading,
      bool isRemoving,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<List<CartItem>> itemsOption,
      required Option<Either<BookingFailure, Unit>> addFailureOrSuccessOption,
      required Option<Either<BookingFailure, Unit>>
          removeFailureOrSuccessOption,
      required Option<Either<BookingFailure, Unit>>
          submitFailureOrSuccessOption}) = _$_CartState;
  _CartState._() : super._();

  @override
  UniqueId? get removingId;
  @override
  bool get isAdding;
  @override
  bool get isLoading;
  @override
  bool get isRemoving;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<List<CartItem>> get itemsOption;
  @override
  Option<Either<BookingFailure, Unit>> get addFailureOrSuccessOption;
  @override
  Option<Either<BookingFailure, Unit>> get removeFailureOrSuccessOption;
  @override
  Option<Either<BookingFailure, Unit>> get submitFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$CartStateCopyWith<_CartState> get copyWith =>
      throw _privateConstructorUsedError;
}
