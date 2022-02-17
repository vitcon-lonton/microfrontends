// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategoryStateTearOff {
  const _$CategoryStateTearOff();

  _CategoryState call(
      {bool isSubmitting = false,
      bool showErrorMessages = true,
      List<Catalogue> catalogues = const <Catalogue>[],
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<ServiceFailure, List<Catalogue>>>
          getCategoriesFailureOrSuccessOption}) {
    return _CategoryState(
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      catalogues: catalogues,
      status: status,
      getCategoriesFailureOrSuccessOption: getCategoriesFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $CategoryState = _$CategoryStateTearOff();

/// @nodoc
mixin _$CategoryState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  List<Catalogue> get catalogues => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<ServiceFailure, List<Catalogue>>>
      get getCategoriesFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryStateCopyWith<CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryStateCopyWith<$Res> {
  factory $CategoryStateCopyWith(
          CategoryState value, $Res Function(CategoryState) then) =
      _$CategoryStateCopyWithImpl<$Res>;
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
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._value, this._then);

  final CategoryState _value;
  // ignore: unused_field
  final $Res Function(CategoryState) _then;

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
abstract class _$CategoryStateCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(
          _CategoryState value, $Res Function(_CategoryState) then) =
      __$CategoryStateCopyWithImpl<$Res>;
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
class __$CategoryStateCopyWithImpl<$Res>
    extends _$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(
      _CategoryState _value, $Res Function(_CategoryState) _then)
      : super(_value, (v) => _then(v as _CategoryState));

  @override
  _CategoryState get _value => super._value as _CategoryState;

  @override
  $Res call({
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? catalogues = freezed,
    Object? status = freezed,
    Object? getCategoriesFailureOrSuccessOption = freezed,
  }) {
    return _then(_CategoryState(
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

class _$_CategoryState extends _CategoryState {
  _$_CategoryState(
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
    return 'CategoryState(isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, catalogues: $catalogues, status: $status, getCategoriesFailureOrSuccessOption: $getCategoriesFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryState &&
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
  _$CategoryStateCopyWith<_CategoryState> get copyWith =>
      __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);
}

abstract class _CategoryState extends CategoryState {
  factory _CategoryState(
      {bool isSubmitting,
      bool showErrorMessages,
      List<Catalogue> catalogues,
      ProcessingStatus status,
      required Option<Either<ServiceFailure, List<Catalogue>>>
          getCategoriesFailureOrSuccessOption}) = _$_CategoryState;
  _CategoryState._() : super._();

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
  _$CategoryStateCopyWith<_CategoryState> get copyWith =>
      throw _privateConstructorUsedError;
}
