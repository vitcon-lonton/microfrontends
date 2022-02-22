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
      List<Catalogue> catalogues = const <Catalogue>[],
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<ServiceFailure, List<Catalogue>>>
          getCategoriesFailureOrSuccessOption}) {
    return _CategoriesState(
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      catalogues: catalogues,
      status: status,
      getCategoriesFailureOrSuccessOption: getCategoriesFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $CategoriesState = _$CategoriesStateTearOff();

/// @nodoc
mixin _$CategoriesState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  List<Catalogue> get catalogues => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<ServiceFailure, List<Catalogue>>>
      get getCategoriesFailureOrSuccessOption =>
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
      List<Catalogue> catalogues,
      ProcessingStatus status,
      Option<Either<ServiceFailure, List<Catalogue>>>
          getCategoriesFailureOrSuccessOption});

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
    Object? catalogues = freezed,
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
      catalogues: catalogues == freezed
          ? _value.catalogues
          : catalogues // ignore: cast_nullable_to_non_nullable
              as List<Catalogue>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      getCategoriesFailureOrSuccessOption: getCategoriesFailureOrSuccessOption ==
              freezed
          ? _value.getCategoriesFailureOrSuccessOption
          : getCategoriesFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, List<Catalogue>>>,
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
      List<Catalogue> catalogues,
      ProcessingStatus status,
      Option<Either<ServiceFailure, List<Catalogue>>>
          getCategoriesFailureOrSuccessOption});

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
    Object? catalogues = freezed,
    Object? status = freezed,
    Object? getCategoriesFailureOrSuccessOption = freezed,
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
      catalogues: catalogues == freezed
          ? _value.catalogues
          : catalogues // ignore: cast_nullable_to_non_nullable
              as List<Catalogue>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
      getCategoriesFailureOrSuccessOption: getCategoriesFailureOrSuccessOption ==
              freezed
          ? _value.getCategoriesFailureOrSuccessOption
          : getCategoriesFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, List<Catalogue>>>,
    ));
  }
}

/// @nodoc

class _$_CategoriesState extends _CategoriesState {
  _$_CategoriesState(
      {this.isSubmitting = false,
      this.showErrorMessages = true,
      this.catalogues = const <Catalogue>[],
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
  final List<Catalogue> catalogues;
  @JsonKey()
  @override
  final ProcessingStatus status;
  @override
  final Option<Either<ServiceFailure, List<Catalogue>>>
      getCategoriesFailureOrSuccessOption;

  @override
  String toString() {
    return 'CategoriesState(isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, catalogues: $catalogues, status: $status, getCategoriesFailureOrSuccessOption: $getCategoriesFailureOrSuccessOption)';
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
            const DeepCollectionEquality()
                .equals(other.catalogues, catalogues) &&
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
      const DeepCollectionEquality().hash(catalogues),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(getCategoriesFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      __$CategoriesStateCopyWithImpl<_CategoriesState>(this, _$identity);
}

abstract class _CategoriesState extends CategoriesState {
  factory _CategoriesState(
      {bool isSubmitting,
      bool showErrorMessages,
      List<Catalogue> catalogues,
      ProcessingStatus status,
      required Option<Either<ServiceFailure, List<Catalogue>>>
          getCategoriesFailureOrSuccessOption}) = _$_CategoriesState;
  _CategoriesState._() : super._();

  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  List<Catalogue> get catalogues;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<ServiceFailure, List<Catalogue>>>
      get getCategoriesFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$CategoriesStateCopyWith<_CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
