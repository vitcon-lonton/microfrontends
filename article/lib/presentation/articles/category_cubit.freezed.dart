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
class _$ArticlesStateTearOff {
  const _$ArticlesStateTearOff();

  _ArticlesState call(
      {bool showErrorMessages = true,
      List<Article> articles = const <Article>[],
      ProcessingStatus status = const ProcessingStatus.idle()}) {
    return _ArticlesState(
      showErrorMessages: showErrorMessages,
      articles: articles,
      status: status,
    );
  }
}

/// @nodoc
const $ArticlesState = _$ArticlesStateTearOff();

/// @nodoc
mixin _$ArticlesState {
  bool get showErrorMessages => throw _privateConstructorUsedError;
  List<Article> get articles => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;

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
      {bool showErrorMessages,
      List<Article> articles,
      ProcessingStatus status});

  $ProcessingStatusCopyWith<$Res> get status;
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
    Object? showErrorMessages = freezed,
    Object? articles = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
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
abstract class _$ArticlesStateCopyWith<$Res>
    implements $ArticlesStateCopyWith<$Res> {
  factory _$ArticlesStateCopyWith(
          _ArticlesState value, $Res Function(_ArticlesState) then) =
      __$ArticlesStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showErrorMessages,
      List<Article> articles,
      ProcessingStatus status});

  @override
  $ProcessingStatusCopyWith<$Res> get status;
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
    Object? showErrorMessages = freezed,
    Object? articles = freezed,
    Object? status = freezed,
  }) {
    return _then(_ArticlesState(
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProcessingStatus,
    ));
  }
}

/// @nodoc

class _$_ArticlesState extends _ArticlesState {
  _$_ArticlesState(
      {this.showErrorMessages = true,
      this.articles = const <Article>[],
      this.status = const ProcessingStatus.idle()})
      : super._();

  @JsonKey()
  @override
  final bool showErrorMessages;
  @JsonKey()
  @override
  final List<Article> articles;
  @JsonKey()
  @override
  final ProcessingStatus status;

  @override
  String toString() {
    return 'ArticlesState(showErrorMessages: $showErrorMessages, articles: $articles, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArticlesState &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.articles, articles) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(articles),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$ArticlesStateCopyWith<_ArticlesState> get copyWith =>
      __$ArticlesStateCopyWithImpl<_ArticlesState>(this, _$identity);
}

abstract class _ArticlesState extends ArticlesState {
  factory _ArticlesState(
      {bool showErrorMessages,
      List<Article> articles,
      ProcessingStatus status}) = _$_ArticlesState;
  _ArticlesState._() : super._();

  @override
  bool get showErrorMessages;
  @override
  List<Article> get articles;
  @override
  ProcessingStatus get status;
  @override
  @JsonKey(ignore: true)
  _$ArticlesStateCopyWith<_ArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}
