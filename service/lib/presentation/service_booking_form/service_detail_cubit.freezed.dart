// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServiceDetailStateTearOff {
  const _$ServiceDetailStateTearOff();

  _ServiceDetailState call(
      {Service? service,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<ServiceFailure, Service>>
          getDetailFailureOrSuccessOption}) {
    return _ServiceDetailState(
      service: service,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      status: status,
      getDetailFailureOrSuccessOption: getDetailFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ServiceDetailState = _$ServiceDetailStateTearOff();

/// @nodoc
mixin _$ServiceDetailState {
  Service? get service => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<ServiceFailure, Service>> get getDetailFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceDetailStateCopyWith<ServiceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDetailStateCopyWith<$Res> {
  factory $ServiceDetailStateCopyWith(
          ServiceDetailState value, $Res Function(ServiceDetailState) then) =
      _$ServiceDetailStateCopyWithImpl<$Res>;
  $Res call(
      {Service? service,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<ServiceFailure, Service>> getDetailFailureOrSuccessOption});

  $ServiceCopyWith<$Res>? get service;
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ServiceDetailStateCopyWithImpl<$Res>
    implements $ServiceDetailStateCopyWith<$Res> {
  _$ServiceDetailStateCopyWithImpl(this._value, this._then);

  final ServiceDetailState _value;
  // ignore: unused_field
  final $Res Function(ServiceDetailState) _then;

  @override
  $Res call({
    Object? service = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? getDetailFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
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
      getDetailFailureOrSuccessOption: getDetailFailureOrSuccessOption ==
              freezed
          ? _value.getDetailFailureOrSuccessOption
          : getDetailFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, Service>>,
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

  @override
  $ProcessingStatusCopyWith<$Res> get status {
    return $ProcessingStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$ServiceDetailStateCopyWith<$Res>
    implements $ServiceDetailStateCopyWith<$Res> {
  factory _$ServiceDetailStateCopyWith(
          _ServiceDetailState value, $Res Function(_ServiceDetailState) then) =
      __$ServiceDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Service? service,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<ServiceFailure, Service>> getDetailFailureOrSuccessOption});

  @override
  $ServiceCopyWith<$Res>? get service;
  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$ServiceDetailStateCopyWithImpl<$Res>
    extends _$ServiceDetailStateCopyWithImpl<$Res>
    implements _$ServiceDetailStateCopyWith<$Res> {
  __$ServiceDetailStateCopyWithImpl(
      _ServiceDetailState _value, $Res Function(_ServiceDetailState) _then)
      : super(_value, (v) => _then(v as _ServiceDetailState));

  @override
  _ServiceDetailState get _value => super._value as _ServiceDetailState;

  @override
  $Res call({
    Object? service = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? getDetailFailureOrSuccessOption = freezed,
  }) {
    return _then(_ServiceDetailState(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
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
      getDetailFailureOrSuccessOption: getDetailFailureOrSuccessOption ==
              freezed
          ? _value.getDetailFailureOrSuccessOption
          : getDetailFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, Service>>,
    ));
  }
}

/// @nodoc

class _$_ServiceDetailState extends _ServiceDetailState {
  _$_ServiceDetailState(
      {this.service,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      this.status = const ProcessingStatus.idle(),
      required this.getDetailFailureOrSuccessOption})
      : super._();

  @override
  final Service? service;
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
  final Option<Either<ServiceFailure, Service>> getDetailFailureOrSuccessOption;

  @override
  String toString() {
    return 'ServiceDetailState(service: $service, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, status: $status, getDetailFailureOrSuccessOption: $getDetailFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceDetailState &&
            const DeepCollectionEquality().equals(other.service, service) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(
                other.getDetailFailureOrSuccessOption,
                getDetailFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(service),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(getDetailFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$ServiceDetailStateCopyWith<_ServiceDetailState> get copyWith =>
      __$ServiceDetailStateCopyWithImpl<_ServiceDetailState>(this, _$identity);
}

abstract class _ServiceDetailState extends ServiceDetailState {
  factory _ServiceDetailState(
      {Service? service,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      required Option<Either<ServiceFailure, Service>>
          getDetailFailureOrSuccessOption}) = _$_ServiceDetailState;
  _ServiceDetailState._() : super._();

  @override
  Service? get service;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<ServiceFailure, Service>> get getDetailFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$ServiceDetailStateCopyWith<_ServiceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
