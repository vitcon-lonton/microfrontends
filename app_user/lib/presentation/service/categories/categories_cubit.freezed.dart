// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoriesStateTearOff {
  const _$CategoriesStateTearOff();

  _CategoriesState call(
      {bool isSubmitting = false,
      bool showErrorMessages = true,
      ProcessingStatus status = STATUS_IDLE,
      required Option<List<Catalogue>> cataloguesOption}) {
    return _CategoriesState(
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      status: status,
      cataloguesOption: cataloguesOption,
    );
  }
}

/// @nodoc
const $CategoriesState = _$CategoriesStateTearOff();

/// @nodoc
mixin _$CategoriesState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<List<Catalogue>> get cataloguesOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res>;
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<List<Catalogue>> cataloguesOption});

  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  final CategoriesState _value;
  // ignore: unused_field
  final $Res Function(CategoriesState) _then;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? cataloguesOption = freezed,
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
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      cataloguesOption: cataloguesOption == freezed
          ? _value.cataloguesOption
          : cataloguesOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Catalogue>>,
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
abstract class _$CategoriesStateCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$CategoriesStateCopyWith(
          _CategoriesState value, $Res Function(_CategoriesState) then) =
      __$CategoriesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<List<Catalogue>> cataloguesOption});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$CategoriesStateCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res>
    implements _$CategoriesStateCopyWith<$Res> {
  __$CategoriesStateCopyWithImpl(
      _CategoriesState _value, $Res Function(_CategoriesState) _then)
      : super(_value, (v) => _then(v as _CategoriesState));

  @override
  _CategoriesState get _value => super._value as _CategoriesState;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? cataloguesOption = freezed,
  }) {
    return _then(_CategoriesState(
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
      cataloguesOption: cataloguesOption == freezed
          ? _value.cataloguesOption
          : cataloguesOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Catalogue>>,
    ));
  }
}

/// @nodoc

class _$_CategoriesState extends _CategoriesState {
  _$_CategoriesState(
      {this.isSubmitting = false,
      this.showErrorMessages = true,
      this.status = STATUS_IDLE,
      required this.cataloguesOption})
      : super._();

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
  final Option<List<Catalogue>> cataloguesOption;

  @override
  String toString() {
    return 'CategoriesState(isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, status: $status, cataloguesOption: $cataloguesOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoriesState &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.cataloguesOption, cataloguesOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(cataloguesOption));

  @JsonKey(ignore: true)
  @override
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      __$CategoriesStateCopyWithImpl<_CategoriesState>(this, _$identity);
}

abstract class _CategoriesState extends CategoriesState {
  factory _CategoriesState(
      {bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      required Option<List<Catalogue>> cataloguesOption}) = _$_CategoriesState;
  _CategoriesState._() : super._();

  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<List<Catalogue>> get cataloguesOption;
  @override
  @JsonKey(ignore: true)
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
