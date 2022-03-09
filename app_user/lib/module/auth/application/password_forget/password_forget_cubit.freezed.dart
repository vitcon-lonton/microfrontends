// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'password_forget_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasswordForgetStateTearOff {
  const _$PasswordForgetStateTearOff();

  _PasswordForgetState call(
      {required Phone phone,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) {
    return _PasswordForgetState(
      phone: phone,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      status: status,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

/// @nodoc
const $PasswordForgetState = _$PasswordForgetStateTearOff();

/// @nodoc
mixin _$PasswordForgetState {
  Phone get phone => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PasswordForgetStateCopyWith<PasswordForgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasswordForgetStateCopyWith<$Res> {
  factory $PasswordForgetStateCopyWith(
          PasswordForgetState value, $Res Function(PasswordForgetState) then) =
      _$PasswordForgetStateCopyWithImpl<$Res>;
  $Res call(
      {Phone phone,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$PasswordForgetStateCopyWithImpl<$Res>
    implements $PasswordForgetStateCopyWith<$Res> {
  _$PasswordForgetStateCopyWithImpl(this._value, this._then);

  final PasswordForgetState _value;
  // ignore: unused_field
  final $Res Function(PasswordForgetState) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
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
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }

  @override
  $ProcessingStatusCopyWith<$Res> get status {
    return $ProcessingStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$PasswordForgetStateCopyWith<$Res>
    implements $PasswordForgetStateCopyWith<$Res> {
  factory _$PasswordForgetStateCopyWith(_PasswordForgetState value,
          $Res Function(_PasswordForgetState) then) =
      __$PasswordForgetStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Phone phone,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<AuthFailure, Unit>> failureOrSuccessOption});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$PasswordForgetStateCopyWithImpl<$Res>
    extends _$PasswordForgetStateCopyWithImpl<$Res>
    implements _$PasswordForgetStateCopyWith<$Res> {
  __$PasswordForgetStateCopyWithImpl(
      _PasswordForgetState _value, $Res Function(_PasswordForgetState) _then)
      : super(_value, (v) => _then(v as _PasswordForgetState));

  @override
  _PasswordForgetState get _value => super._value as _PasswordForgetState;

  @override
  $Res call({
    Object? phone = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_PasswordForgetState(
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
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      failureOrSuccessOption: failureOrSuccessOption == freezed
          ? _value.failureOrSuccessOption
          : failureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_PasswordForgetState extends _PasswordForgetState {
  _$_PasswordForgetState(
      {required this.phone,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      this.status = const ProcessingStatus.idle(),
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
  @JsonKey()
  @override
  final ProcessingStatus status;
  @override
  final Option<Either<AuthFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'PasswordForgetState(phone: $phone, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, status: $status, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PasswordForgetState &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.failureOrSuccessOption, failureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$PasswordForgetStateCopyWith<_PasswordForgetState> get copyWith =>
      __$PasswordForgetStateCopyWithImpl<_PasswordForgetState>(
          this, _$identity);
}

abstract class _PasswordForgetState extends PasswordForgetState {
  factory _PasswordForgetState(
          {required Phone phone,
          bool isSubmitting,
          bool showErrorMessages,
          ProcessingStatus status,
          required Option<Either<AuthFailure, Unit>> failureOrSuccessOption}) =
      _$_PasswordForgetState;
  _PasswordForgetState._() : super._();

  @override
  Phone get phone;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<AuthFailure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$PasswordForgetStateCopyWith<_PasswordForgetState> get copyWith =>
      throw _privateConstructorUsedError;
}
