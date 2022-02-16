// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_theme_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ThemeTypeStateTearOff {
  const _$ThemeTypeStateTearOff();

  _ThemeTypeState call({ThemeType theme = ThemeType.light}) {
    return _ThemeTypeState(
      theme: theme,
    );
  }
}

/// @nodoc
const $ThemeTypeState = _$ThemeTypeStateTearOff();

/// @nodoc
mixin _$ThemeTypeState {
  ThemeType get theme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeTypeStateCopyWith<ThemeTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeTypeStateCopyWith<$Res> {
  factory $ThemeTypeStateCopyWith(
          ThemeTypeState value, $Res Function(ThemeTypeState) then) =
      _$ThemeTypeStateCopyWithImpl<$Res>;
  $Res call({ThemeType theme});
}

/// @nodoc
class _$ThemeTypeStateCopyWithImpl<$Res>
    implements $ThemeTypeStateCopyWith<$Res> {
  _$ThemeTypeStateCopyWithImpl(this._value, this._then);

  final ThemeTypeState _value;
  // ignore: unused_field
  final $Res Function(ThemeTypeState) _then;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeType,
    ));
  }
}

/// @nodoc
abstract class _$ThemeTypeStateCopyWith<$Res>
    implements $ThemeTypeStateCopyWith<$Res> {
  factory _$ThemeTypeStateCopyWith(
          _ThemeTypeState value, $Res Function(_ThemeTypeState) then) =
      __$ThemeTypeStateCopyWithImpl<$Res>;
  @override
  $Res call({ThemeType theme});
}

/// @nodoc
class __$ThemeTypeStateCopyWithImpl<$Res>
    extends _$ThemeTypeStateCopyWithImpl<$Res>
    implements _$ThemeTypeStateCopyWith<$Res> {
  __$ThemeTypeStateCopyWithImpl(
      _ThemeTypeState _value, $Res Function(_ThemeTypeState) _then)
      : super(_value, (v) => _then(v as _ThemeTypeState));

  @override
  _ThemeTypeState get _value => super._value as _ThemeTypeState;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_ThemeTypeState(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as ThemeType,
    ));
  }
}

/// @nodoc

class _$_ThemeTypeState extends _ThemeTypeState {
  _$_ThemeTypeState({this.theme = ThemeType.light}) : super._();

  @JsonKey(defaultValue: ThemeType.light)
  @override
  final ThemeType theme;

  @override
  String toString() {
    return 'ThemeTypeState(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ThemeTypeState &&
            (identical(other.theme, theme) ||
                const DeepCollectionEquality().equals(other.theme, theme)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(theme);

  @JsonKey(ignore: true)
  @override
  _$ThemeTypeStateCopyWith<_ThemeTypeState> get copyWith =>
      __$ThemeTypeStateCopyWithImpl<_ThemeTypeState>(this, _$identity);
}

abstract class _ThemeTypeState extends ThemeTypeState {
  factory _ThemeTypeState({ThemeType theme}) = _$_ThemeTypeState;
  _ThemeTypeState._() : super._();

  @override
  ThemeType get theme => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThemeTypeStateCopyWith<_ThemeTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}
