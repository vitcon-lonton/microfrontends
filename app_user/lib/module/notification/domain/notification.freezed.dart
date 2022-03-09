// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationTearOff {
  const _$NotificationTearOff();

  _Notification call(
      {required UniqueId id,
      required String name,
      required double price,
      required DateTime time,
      NotificationStatus status = NotificationStatus.created}) {
    return _Notification(
      id: id,
      name: name,
      price: price,
      time: time,
      status: status,
    );
  }
}

/// @nodoc
const $Notification = _$NotificationTearOff();

/// @nodoc
mixin _$Notification {
  UniqueId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  NotificationStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      String name,
      double price,
      DateTime time,
      NotificationStatus status});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res> implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  final Notification _value;
  // ignore: unused_field
  final $Res Function(Notification) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
    ));
  }
}

/// @nodoc
abstract class _$NotificationCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(
          _Notification value, $Res Function(_Notification) then) =
      __$NotificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      String name,
      double price,
      DateTime time,
      NotificationStatus status});
}

/// @nodoc
class __$NotificationCopyWithImpl<$Res> extends _$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(
      _Notification _value, $Res Function(_Notification) _then)
      : super(_value, (v) => _then(v as _Notification));

  @override
  _Notification get _value => super._value as _Notification;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
    Object? time = freezed,
    Object? status = freezed,
  }) {
    return _then(_Notification(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
    ));
  }
}

/// @nodoc

class _$_Notification implements _Notification {
  const _$_Notification(
      {required this.id,
      required this.name,
      required this.price,
      required this.time,
      this.status = NotificationStatus.created});

  @override
  final UniqueId id;
  @override
  final String name;
  @override
  final double price;
  @override
  final DateTime time;
  @JsonKey()
  @override
  final NotificationStatus status;

  @override
  String toString() {
    return 'Notification(id: $id, name: $name, price: $price, time: $time, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Notification &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$NotificationCopyWith<_Notification> get copyWith =>
      __$NotificationCopyWithImpl<_Notification>(this, _$identity);
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required UniqueId id,
      required String name,
      required double price,
      required DateTime time,
      NotificationStatus status}) = _$_Notification;

  @override
  UniqueId get id;
  @override
  String get name;
  @override
  double get price;
  @override
  DateTime get time;
  @override
  NotificationStatus get status;
  @override
  @JsonKey(ignore: true)
  _$NotificationCopyWith<_Notification> get copyWith =>
      throw _privateConstructorUsedError;
}
