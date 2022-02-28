// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'confirm_otp_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OtpConfirmStateTearOff {
  const _$OtpConfirmStateTearOff();

  _OtpConfirmState call(
      {required Phone phone,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) {
    return _OtpConfirmState(
      phone: phone,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

/// @nodoc
const $OtpConfirmState = _$OtpConfirmStateTearOff();

/// @nodoc
mixin _$OtpConfirmState {
  Phone get phone => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpConfirmStateCopyWith<OtpConfirmState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpConfirmStateCopyWith<$Res> {
  factory $OtpConfirmStateCopyWith(
          OtpConfirmState value, $Res Function(OtpConfirmState) then) =
      _$OtpConfirmStateCopyWithImpl<$Res>;
  $Res call(
      {Phone phone,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});
}

/// @nodoc
class _$OtpConfirmStateCopyWithImpl<$Res>
    implements $OtpConfirmStateCopyWith<$Res> {
  _$OtpConfirmStateCopyWithImpl(this._value, this._then);

  final OtpConfirmState _value;
  // ignore: unused_field
  final $Res Function(OtpConfirmState) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
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
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$OtpConfirmStateCopyWith<$Res>
    implements $OtpConfirmStateCopyWith<$Res> {
  factory _$OtpConfirmStateCopyWith(
          _OtpConfirmState value, $Res Function(_OtpConfirmState) then) =
      __$OtpConfirmStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Phone phone,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});
}

/// @nodoc
class __$OtpConfirmStateCopyWithImpl<$Res>
    extends _$OtpConfirmStateCopyWithImpl<$Res>
    implements _$OtpConfirmStateCopyWith<$Res> {
  __$OtpConfirmStateCopyWithImpl(
      _OtpConfirmState _value, $Res Function(_OtpConfirmState) _then)
      : super(_value, (v) => _then(v as _OtpConfirmState));

  @override
  _OtpConfirmState get _value => super._value as _OtpConfirmState;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_OtpConfirmState(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
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
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_OtpConfirmState extends _OtpConfirmState {
  _$_OtpConfirmState(
      {required this.phone,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final Phone phone;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<AuthFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'OtpConfirmState(phone: $phone, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OtpConfirmState &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
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
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$OtpConfirmStateCopyWith<_OtpConfirmState> get copyWith =>
      __$OtpConfirmStateCopyWithImpl<_OtpConfirmState>(this, _$identity);
}

abstract class _OtpConfirmState extends OtpConfirmState {
  factory _OtpConfirmState(
          {required Phone phone,
          bool isSubmitting,
          bool showErrorMessages,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _$_OtpConfirmState;
  _OtpConfirmState._() : super._();

  @override
  Phone get phone;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$OtpConfirmStateCopyWith<_OtpConfirmState> get copyWith =>
      throw _privateConstructorUsedError;
}
