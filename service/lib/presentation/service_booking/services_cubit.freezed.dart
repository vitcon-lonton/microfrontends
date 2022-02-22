// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'services_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServicesStateTearOff {
  const _$ServicesStateTearOff();

  _ServicesState call(
      {bool isSubmitting = false,
      bool showErrorMessages = true,
      List<Service> services = const <Service>[],
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<ServiceFailure, List<Service>>>
          getCategoriesFailureOrSuccessOption}) {
    return _ServicesState(
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      services: services,
      status: status,
      getCategoriesFailureOrSuccessOption: getCategoriesFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ServicesState = _$ServicesStateTearOff();

/// @nodoc
mixin _$ServicesState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  List<Service> get services => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<ServiceFailure, List<Service>>>
      get getCategoriesFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServicesStateCopyWith<ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesStateCopyWith<$Res> {
  factory $ServicesStateCopyWith(
          ServicesState value, $Res Function(ServicesState) then) =
      _$ServicesStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      List<Service> services,
      ProcessingStatus status,
      Option<Either<ServiceFailure, List<Service>>>
          getCategoriesFailureOrSuccessOption});

  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ServicesStateCopyWithImpl<$Res>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._value, this._then);

  final ServicesState _value;
  // ignore: unused_field
  final $Res Function(ServicesState) _then;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? services = freezed,
    Object? status = freezed,
    Object? getCategoriesFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      getCategoriesFailureOrSuccessOption: getCategoriesFailureOrSuccessOption ==
              freezed
          ? _value.getCategoriesFailureOrSuccessOption
          : getCategoriesFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, List<Service>>>,
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
abstract class _$ServicesStateCopyWith<$Res>
    implements $ServicesStateCopyWith<$Res> {
  factory _$ServicesStateCopyWith(
          _ServicesState value, $Res Function(_ServicesState) then) =
      __$ServicesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      List<Service> services,
      ProcessingStatus status,
      Option<Either<ServiceFailure, List<Service>>>
          getCategoriesFailureOrSuccessOption});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$ServicesStateCopyWithImpl<$Res>
    extends _$ServicesStateCopyWithImpl<$Res>
    implements _$ServicesStateCopyWith<$Res> {
  __$ServicesStateCopyWithImpl(
      _ServicesState _value, $Res Function(_ServicesState) _then)
      : super(_value, (v) => _then(v as _ServicesState));

  @override
  _ServicesState get _value => super._value as _ServicesState;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? services = freezed,
    Object? status = freezed,
    Object? getCategoriesFailureOrSuccessOption = freezed,
  }) {
    return _then(_ServicesState(
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      getCategoriesFailureOrSuccessOption: getCategoriesFailureOrSuccessOption ==
              freezed
          ? _value.getCategoriesFailureOrSuccessOption
          : getCategoriesFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, List<Service>>>,
    ));
  }
}

/// @nodoc

class _$_ServicesState extends _ServicesState {
  _$_ServicesState(
      {this.isSubmitting = false,
      this.showErrorMessages = true,
      this.services = const <Service>[],
      this.status = const ProcessingStatus.idle(),
      required this.getCategoriesFailureOrSuccessOption})
      : super._();

  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @JsonKey()
  @override
  final List<Service> services;
  @JsonKey()
  @override
  final ProcessingStatus status;
  @override
  final Option<Either<ServiceFailure, List<Service>>>
      getCategoriesFailureOrSuccessOption;

  @override
  String toString() {
    return 'ServicesState(isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, services: $services, status: $status, getCategoriesFailureOrSuccessOption: $getCategoriesFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServicesState &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(
                other.getCategoriesFailureOrSuccessOption,
                getCategoriesFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(services),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(getCategoriesFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$ServicesStateCopyWith<_ServicesState> get copyWith =>
      __$ServicesStateCopyWithImpl<_ServicesState>(this, _$identity);
}

abstract class _ServicesState extends ServicesState {
  factory _ServicesState(
      {bool isSubmitting,
      bool showErrorMessages,
      List<Service> services,
      ProcessingStatus status,
      required Option<Either<ServiceFailure, List<Service>>>
          getCategoriesFailureOrSuccessOption}) = _$_ServicesState;
  _ServicesState._() : super._();

  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  List<Service> get services;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<ServiceFailure, List<Service>>>
      get getCategoriesFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$ServicesStateCopyWith<_ServicesState> get copyWith =>
      throw _privateConstructorUsedError;
}
