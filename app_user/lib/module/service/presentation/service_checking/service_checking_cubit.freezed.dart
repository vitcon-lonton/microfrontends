// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_checking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServiceCheckingStateTearOff {
  const _$ServiceCheckingStateTearOff();

  _ServiceCheckingState call(
      {Service? service,
      required DateTime date,
      required DateTime time,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<Either<ServiceFailure, Unit>> failureOrSuccessOption}) {
    return _ServiceCheckingState(
      service: service,
      date: date,
      time: time,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      failureOrSuccessOption: failureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ServiceCheckingState = _$ServiceCheckingStateTearOff();

/// @nodoc
mixin _$ServiceCheckingState {
  Service? get service => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<Either<ServiceFailure, Unit>> get failureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceCheckingStateCopyWith<ServiceCheckingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCheckingStateCopyWith<$Res> {
  factory $ServiceCheckingStateCopyWith(ServiceCheckingState value,
          $Res Function(ServiceCheckingState) then) =
      _$ServiceCheckingStateCopyWithImpl<$Res>;
  $Res call(
      {Service? service,
      DateTime date,
      DateTime time,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ServiceFailure, Unit>> failureOrSuccessOption});

  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class _$ServiceCheckingStateCopyWithImpl<$Res>
    implements $ServiceCheckingStateCopyWith<$Res> {
  _$ServiceCheckingStateCopyWithImpl(this._value, this._then);

  final ServiceCheckingState _value;
  // ignore: unused_field
  final $Res Function(ServiceCheckingState) _then;

  @override
  $Res call({
    Object? service = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as Option<Either<ServiceFailure, Unit>>,
    ));
  }

  @override
  $ServiceCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $ServiceCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value));
    });
  }
}

/// @nodoc
abstract class _$ServiceCheckingStateCopyWith<$Res>
    implements $ServiceCheckingStateCopyWith<$Res> {
  factory _$ServiceCheckingStateCopyWith(_ServiceCheckingState value,
          $Res Function(_ServiceCheckingState) then) =
      __$ServiceCheckingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Service? service,
      DateTime date,
      DateTime time,
      bool isSubmitting,
      bool showErrorMessages,
      Option<Either<ServiceFailure, Unit>> failureOrSuccessOption});

  @override
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class __$ServiceCheckingStateCopyWithImpl<$Res>
    extends _$ServiceCheckingStateCopyWithImpl<$Res>
    implements _$ServiceCheckingStateCopyWith<$Res> {
  __$ServiceCheckingStateCopyWithImpl(
      _ServiceCheckingState _value, $Res Function(_ServiceCheckingState) _then)
      : super(_value, (v) => _then(v as _ServiceCheckingState));

  @override
  _ServiceCheckingState get _value => super._value as _ServiceCheckingState;

  @override
  $Res call({
    Object? service = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? failureOrSuccessOption = freezed,
  }) {
    return _then(_ServiceCheckingState(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
              as Option<Either<ServiceFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ServiceCheckingState extends _ServiceCheckingState {
  _$_ServiceCheckingState(
      {this.service,
      required this.date,
      required this.time,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.failureOrSuccessOption})
      : super._();

  @override
  final Service? service;
  @override
  final DateTime date;
  @override
  final DateTime time;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @override
  final Option<Either<ServiceFailure, Unit>> failureOrSuccessOption;

  @override
  String toString() {
    return 'ServiceCheckingState(service: $service, date: $date, time: $time, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, failureOrSuccessOption: $failureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceCheckingState &&
            const DeepCollectionEquality().equals(other.service, service) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
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
      const DeepCollectionEquality().hash(service),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(failureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$ServiceCheckingStateCopyWith<_ServiceCheckingState> get copyWith =>
      __$ServiceCheckingStateCopyWithImpl<_ServiceCheckingState>(
          this, _$identity);
}

abstract class _ServiceCheckingState extends ServiceCheckingState {
  factory _ServiceCheckingState(
      {Service? service,
      required DateTime date,
      required DateTime time,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<Either<ServiceFailure, Unit>>
          failureOrSuccessOption}) = _$_ServiceCheckingState;
  _ServiceCheckingState._() : super._();

  @override
  Service? get service;
  @override
  DateTime get date;
  @override
  DateTime get time;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<Either<ServiceFailure, Unit>> get failureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$ServiceCheckingStateCopyWith<_ServiceCheckingState> get copyWith =>
      throw _privateConstructorUsedError;
}
