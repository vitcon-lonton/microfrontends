// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_rating_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrderRatingStateTearOff {
  const _$OrderRatingStateTearOff();

  _OrderRatingState call(
      {double point = 5.0,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<Either<BookingFailure, Unit>> failureOrSuccessOption}) {
    return _OrderRatingState(
      point: point,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

/// @nodoc
const $OrderRatingState = _$OrderRatingStateTearOff();

/// @nodoc
mixin _$OrderRatingState {
  double get point => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<BookingFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderRatingStateCopyWith<OrderRatingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderRatingStateCopyWith<$Res> {
  factory $OrderRatingStateCopyWith(
          OrderRatingState value, $Res Function(OrderRatingState) then) =
      _$OrderRatingStateCopyWithImpl<$Res>;
  $Res call(
      {double point,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<BookingFailure, Unit>> failureOrSuccessOption});
}

/// @nodoc
class _$OrderRatingStateCopyWithImpl<$Res>
    implements $OrderRatingStateCopyWith<$Res> {
  _$OrderRatingStateCopyWithImpl(this._value, this._then);

  final OrderRatingState _value;
  // ignore: unused_field
  final $Res Function(OrderRatingState) _then;

  @override
  $Res call({
    Object? point = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as double,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$OrderRatingStateCopyWith<$Res>
    implements $OrderRatingStateCopyWith<$Res> {
  factory _$OrderRatingStateCopyWith(
          _OrderRatingState value, $Res Function(_OrderRatingState) then) =
      __$OrderRatingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {double point,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<BookingFailure, Unit>> failureOrSuccessOption});
}

/// @nodoc
class __$OrderRatingStateCopyWithImpl<$Res>
    extends _$OrderRatingStateCopyWithImpl<$Res>
    implements _$OrderRatingStateCopyWith<$Res> {
  __$OrderRatingStateCopyWithImpl(
      _OrderRatingState _value, $Res Function(_OrderRatingState) _then)
      : super(_value, (v) => _then(v as _OrderRatingState));

  @override
  _OrderRatingState get _value => super._value as _OrderRatingState;

  @override
  $Res call({
    Object? point = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_OrderRatingState(
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as double,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_OrderRatingState extends _OrderRatingState {
  _$_OrderRatingState(
      {this.point = 5.0,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.failureOrSuccessOption})
      : super._();

  @JsonKey()
  @override
  final double point;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<BookingFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'OrderRatingState(point: $point, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderRatingState &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccessOption, failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$OrderRatingStateCopyWith<_OrderRatingState> get copyWith =>
      __$OrderRatingStateCopyWithImpl<_OrderRatingState>(this, _$identity);
}

abstract class _OrderRatingState extends OrderRatingState {
  factory _OrderRatingState(
      {double point,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<Either<BookingFailure, Unit>>
          failureOrSuccessOption}) = _$_OrderRatingState;
  _OrderRatingState._() : super._();

  @override
  double get point;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<BookingFailure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$OrderRatingStateCopyWith<_OrderRatingState> get copyWith =>
      throw _privateConstructorUsedError;
}
