// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'articles_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ArticlesStateTearOff {
  const _$ArticlesStateTearOff();

  _ArticlesState call(
      {dynamic page = 1,
      dynamic perPage = 10,
      dynamic pageCount = 1,
      dynamic totalCount = 0,
      dynamic status = STATUS_IDLE,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<List<Article>> articlesOption}) {
    return _ArticlesState(
      page: page,
      perPage: perPage,
      pageCount: pageCount,
      totalCount: totalCount,
      status: status,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      articlesOption: articlesOption,
    );
  }
}

/// @nodoc
const $ArticlesState = _$ArticlesStateTearOff();

/// @nodoc
mixin _$ArticlesState {
  dynamic get page => throw _privateConstructorUsedError;
  dynamic get perPage => throw _privateConstructorUsedError;
  dynamic get pageCount => throw _privateConstructorUsedError;
  dynamic get totalCount => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<List<Article>> get articlesOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticlesStateCopyWith<ArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesStateCopyWith<$Res> {
  factory $ArticlesStateCopyWith(
          ArticlesState value, $Res Function(ArticlesState) then) =
      _$ArticlesStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic page,
      dynamic perPage,
      dynamic pageCount,
      dynamic totalCount,
      dynamic status,
      bool isSubmitting,
      bool showErrorMessages,
      Option<List<Article>> articlesOption});
}

/// @nodoc
class _$ArticlesStateCopyWithImpl<$Res>
    implements $ArticlesStateCopyWith<$Res> {
  _$ArticlesStateCopyWithImpl(this._value, this._then);

  final ArticlesState _value;
  // ignore: unused_field
  final $Res Function(ArticlesState) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? pageCount = freezed,
    Object? totalCount = freezed,
    Object? status = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? articlesOption = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as dynamic,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pageCount: pageCount == freezed
          ? _value.pageCount
          : pageCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalCount: totalCount == freezed
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      articlesOption: articlesOption == freezed
          ? _value.articlesOption
          : articlesOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Article>>,
    ));
  }
}

/// @nodoc
abstract class _$ArticlesStateCopyWith<$Res>
    implements $ArticlesStateCopyWith<$Res> {
  factory _$ArticlesStateCopyWith(
          _ArticlesState value, $Res Function(_ArticlesState) then) =
      __$ArticlesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic page,
      dynamic perPage,
      dynamic pageCount,
      dynamic totalCount,
      dynamic status,
      bool isSubmitting,
      bool showErrorMessages,
      Option<List<Article>> articlesOption});
}

/// @nodoc
class __$ArticlesStateCopyWithImpl<$Res>
    extends _$ArticlesStateCopyWithImpl<$Res>
    implements _$ArticlesStateCopyWith<$Res> {
  __$ArticlesStateCopyWithImpl(
      _ArticlesState _value, $Res Function(_ArticlesState) _then)
      : super(_value, (v) => _then(v as _ArticlesState));

  @override
  _ArticlesState get _value => super._value as _ArticlesState;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? pageCount = freezed,
    Object? totalCount = freezed,
    Object? status = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? articlesOption = freezed,
  }) {
    return _then(_ArticlesState(
      page: page == freezed ? _value.page : page,
      perPage: perPage == freezed ? _value.perPage : perPage,
      pageCount: pageCount == freezed ? _value.pageCount : pageCount,
      totalCount: totalCount == freezed ? _value.totalCount : totalCount,
      status: status == freezed ? _value.status : status,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      articlesOption: articlesOption == freezed
          ? _value.articlesOption
          : articlesOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Article>>,
    ));
  }
}

/// @nodoc

class _$_ArticlesState extends _ArticlesState with DiagnosticableTreeMixin {
  _$_ArticlesState(
      {this.page = 1,
      this.perPage = 10,
      this.pageCount = 1,
      this.totalCount = 0,
      this.status = STATUS_IDLE,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.articlesOption})
      : super._();

  @JsonKey()
  @override
  final dynamic page;
  @JsonKey()
  @override
  final dynamic perPage;
  @JsonKey()
  @override
  final dynamic pageCount;
  @JsonKey()
  @override
  final dynamic totalCount;
  @JsonKey()
  @override
  final dynamic status;
  @JsonKey()
  @override
  final bool isSubmitting;
  @JsonKey()
  @override
  final bool showErrorMessages;
  @override
  final Option<List<Article>> articlesOption;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArticlesState(page: $page, perPage: $perPage, pageCount: $pageCount, totalCount: $totalCount, status: $status, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, articlesOption: $articlesOption)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArticlesState'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('perPage', perPage))
      ..add(DiagnosticsProperty('pageCount', pageCount))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('showErrorMessages', showErrorMessages))
      ..add(DiagnosticsProperty('articlesOption', articlesOption));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArticlesState &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.perPage, perPage) &&
            const DeepCollectionEquality().equals(other.pageCount, pageCount) &&
            const DeepCollectionEquality()
                .equals(other.totalCount, totalCount) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality()
                .equals(other.articlesOption, articlesOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(perPage),
      const DeepCollectionEquality().hash(pageCount),
      const DeepCollectionEquality().hash(totalCount),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(articlesOption));

  @JsonKey(ignore: true)
  @override
  _$ArticlesStateCopyWith<_ArticlesState> get copyWith =>
      __$ArticlesStateCopyWithImpl<_ArticlesState>(this, _$identity);
}

abstract class _ArticlesState extends ArticlesState {
  factory _ArticlesState(
      {dynamic page,
      dynamic perPage,
      dynamic pageCount,
      dynamic totalCount,
      dynamic status,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<List<Article>> articlesOption}) = _$_ArticlesState;
  _ArticlesState._() : super._();

  @override
  dynamic get page;
  @override
  dynamic get perPage;
  @override
  dynamic get pageCount;
  @override
  dynamic get totalCount;
  @override
  dynamic get status;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  Option<List<Article>> get articlesOption;
  @override
  @JsonKey(ignore: true)
  _$ArticlesStateCopyWith<_ArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}
