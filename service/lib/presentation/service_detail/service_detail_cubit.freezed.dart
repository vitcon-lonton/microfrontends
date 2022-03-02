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
      {bool isLiked = false,
      bool isSubmitting = false,
      bool isSubmittingLike = false,
      bool showErrorMessages = true,
      ProcessingStatus status = STATUS_IDLE,
      required Option<Service> detailOption}) {
    return _ServiceDetailState(
      isLiked: isLiked,
      isSubmitting: isSubmitting,
      isSubmittingLike: isSubmittingLike,
      showErrorMessages: showErrorMessages,
      status: status,
      detailOption: detailOption,
    );
  }
}

/// @nodoc
const $ServiceDetailState = _$ServiceDetailStateTearOff();

/// @nodoc
mixin _$ServiceDetailState {
  bool get isLiked => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSubmittingLike => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Service> get detailOption => throw _privateConstructorUsedError;

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
      {bool isLiked,
      bool isSubmitting,
      bool isSubmittingLike,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Service> detailOption});

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
    Object? isLiked = freezed,
    Object? isSubmitting = freezed,
    Object? isSubmittingLike = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? detailOption = freezed,
  }) {
    return _then(_value.copyWith(
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmittingLike: isSubmittingLike == freezed
          ? _value.isSubmittingLike
          : isSubmittingLike // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      detailOption: detailOption == freezed
          ? _value.detailOption
          : detailOption // ignore: cast_nullable_to_non_nullable
              as Option<Service>,
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
abstract class _$ServiceDetailStateCopyWith<$Res>
    implements $ServiceDetailStateCopyWith<$Res> {
  factory _$ServiceDetailStateCopyWith(
          _ServiceDetailState value, $Res Function(_ServiceDetailState) then) =
      __$ServiceDetailStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLiked,
      bool isSubmitting,
      bool isSubmittingLike,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Service> detailOption});

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
    Object? isLiked = freezed,
    Object? isSubmitting = freezed,
    Object? isSubmittingLike = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? detailOption = freezed,
  }) {
    return _then(_ServiceDetailState(
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmittingLike: isSubmittingLike == freezed
          ? _value.isSubmittingLike
          : isSubmittingLike // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      detailOption: detailOption == freezed
          ? _value.detailOption
          : detailOption // ignore: cast_nullable_to_non_nullable
              as Option<Service>,
    ));
  }
}

/// @nodoc

class _$_ServiceDetailState extends _ServiceDetailState {
  _$_ServiceDetailState(
      {this.isLiked = false,
      this.isSubmitting = false,
      this.isSubmittingLike = false,
      this.showErrorMessages = true,
      this.status = STATUS_IDLE,
      required this.detailOption})
      : super._();

  @JsonKey()
  @override
  final bool isLiked;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool isSubmittingLike;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @JsonKey()
  @override
  final ProcessingStatus status;
  @override
  final Option<Service> detailOption;

  @override
  String toString() {
    return 'ServiceDetailState(isLiked: $isLiked, isSubmitting: $isSubmitting, isSubmittingLike: $isSubmittingLike, showErrorMessages: $showErrorMessages, status: $status, detailOption: $detailOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceDetailState &&
            const DeepCollectionEquality().equals(other.isLiked, isLiked) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.isSubmittingLike, isSubmittingLike) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.detailOption, detailOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLiked),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(isSubmittingLike),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(detailOption));

  @JsonKey(ignore: true)
  @override
  _$ServiceDetailStateCopyWith<_ServiceDetailState> get copyWith =>
      __$ServiceDetailStateCopyWithImpl<_ServiceDetailState>(this, _$identity);
}

abstract class _ServiceDetailState extends ServiceDetailState {
  factory _ServiceDetailState(
      {bool isLiked,
      bool isSubmitting,
      bool isSubmittingLike,
      bool showErrorMessages,
      ProcessingStatus status,
      required Option<Service> detailOption}) = _$_ServiceDetailState;
  _ServiceDetailState._() : super._();

  @override
  bool get isLiked;
  @override
  bool get isSubmitting;
  @override
  bool get isSubmittingLike;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<Service> get detailOption;
  @override
  @JsonKey(ignore: true)
  _$ServiceDetailStateCopyWith<_ServiceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
