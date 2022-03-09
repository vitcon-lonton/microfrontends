// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrderDetailStateTearOff {
  const _$OrderDetailStateTearOff();

  _OrderDetailState call(
      {dynamic status = STATUS_IDLE,
      bool isCanceling = false,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<Order> orderOption,
      required Option<Either<BookingFailure, Unit>>
          cancelFailureOrSuccessOption}) {
    return _OrderDetailState(
      status: status,
      isCanceling: isCanceling,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      orderOption: orderOption,
      cancelFailureOrSuccessOption: cancelFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $OrderDetailState = _$OrderDetailStateTearOff();

/// @nodoc
mixin _$OrderDetailState {
  dynamic get status => throw _privateConstructorUsedError;
  bool get isCanceling => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Order> get orderOption => throw _privateConstructorUsedError;
  Option<Either<BookingFailure, Unit>> get cancelFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailStateCopyWith<OrderDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailStateCopyWith<$Res> {
  factory $OrderDetailStateCopyWith(
          OrderDetailState value, $Res Function(OrderDetailState) then) =
      _$OrderDetailStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic status,
      bool isCanceling,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Order> orderOption,
      Option<Either<BookingFailure, Unit>> cancelFailureOrSuccessOption});
}

/// @nodoc
class _$OrderDetailStateCopyWithImpl<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  _$OrderDetailStateCopyWithImpl(this._value, this._then);

  final OrderDetailState _value;
  // ignore: unused_field
  final $Res Function(OrderDetailState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? isCanceling = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? orderOption = freezed,
    Object? cancelFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isCanceling: isCanceling == freezed
          ? _value.isCanceling
          : isCanceling // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      orderOption: orderOption == freezed
          ? _value.orderOption
          : orderOption // ignore: cast_nullable_to_non_nullable
              as Option<Order>,
      cancelFailureOrSuccessOption: cancelFailureOrSuccessOption == freezed
          ? _value.cancelFailureOrSuccessOption
          : cancelFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$OrderDetailStateCopyWith<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  factory _$OrderDetailStateCopyWith(
          _OrderDetailState value, $Res Function(_OrderDetailState) then) =
      __$OrderDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic status,
      bool isCanceling,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Order> orderOption,
      Option<Either<BookingFailure, Unit>> cancelFailureOrSuccessOption});
}

/// @nodoc
class __$OrderDetailStateCopyWithImpl<$Res>
    extends _$OrderDetailStateCopyWithImpl<$Res>
    implements _$OrderDetailStateCopyWith<$Res> {
  __$OrderDetailStateCopyWithImpl(
      _OrderDetailState _value, $Res Function(_OrderDetailState) _then)
      : super(_value, (v) => _then(v as _OrderDetailState));

  @override
  _OrderDetailState get _value => super._value as _OrderDetailState;

  @override
  $Res call({
    Object? status = freezed,
    Object? isCanceling = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? orderOption = freezed,
    Object? cancelFailureOrSuccessOption = freezed,
  }) {
    return _then(_OrderDetailState(
      status: status == freezed ? _value.status : status,
      isCanceling: isCanceling == freezed
          ? _value.isCanceling
          : isCanceling // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      orderOption: orderOption == freezed
          ? _value.orderOption
          : orderOption // ignore: cast_nullable_to_non_nullable
              as Option<Order>,
      cancelFailureOrSuccessOption: cancelFailureOrSuccessOption == freezed
          ? _value.cancelFailureOrSuccessOption
          : cancelFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<BookingFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_OrderDetailState extends _OrderDetailState {
  _$_OrderDetailState(
      {this.status = STATUS_IDLE,
      this.isCanceling = false,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.orderOption,
      required this.cancelFailureOrSuccessOption})
      : super._();

  @JsonKey()
  @override
  final dynamic status;
  @JsonKey()
  @override
  final bool isCanceling;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @override
  final Option<Order> orderOption;
  @override
  final Option<Either<BookingFailure, Unit>> cancelFailureOrSuccessOption;

  @override
  String toString() {
    return 'OrderDetailState(status: $status, isCanceling: $isCanceling, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, orderOption: $orderOption, cancelFailureOrSuccessOption: $cancelFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderDetailState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.isCanceling, isCanceling) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.orderOption, orderOption) &&
            const DeepCollectionEquality().equals(
                other.cancelFailureOrSuccessOption,
                cancelFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(isCanceling),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(orderOption),
      const DeepCollectionEquality().hash(cancelFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$OrderDetailStateCopyWith<_OrderDetailState> get copyWith =>
      __$OrderDetailStateCopyWithImpl<_OrderDetailState>(this, _$identity);
}

abstract class _OrderDetailState extends OrderDetailState {
  factory _OrderDetailState(
      {dynamic status,
      bool isCanceling,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<Order> orderOption,
      required Option<Either<BookingFailure, Unit>>
          cancelFailureOrSuccessOption}) = _$_OrderDetailState;
  _OrderDetailState._() : super._();

  @override
  dynamic get status;
  @override
  bool get isCanceling;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<Order> get orderOption;
  @override
  Option<Either<BookingFailure, Unit>> get cancelFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$OrderDetailStateCopyWith<_OrderDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
