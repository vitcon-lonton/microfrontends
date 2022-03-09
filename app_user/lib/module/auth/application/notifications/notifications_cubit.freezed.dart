// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationsStateTearOff {
  const _$NotificationsStateTearOff();

  _NotificationsState call(
      {dynamic page = 1,
      dynamic perPage = 10,
      dynamic pageCount = 1,
      dynamic totalCount = 0,
      dynamic status = STATUS_IDLE,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<List<Order>> ordersOption}) {
    return _NotificationsState(
      page: page,
      perPage: perPage,
      pageCount: pageCount,
      totalCount: totalCount,
      status: status,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      ordersOption: ordersOption,
    );
  }
}

/// @nodoc
const $NotificationsState = _$NotificationsStateTearOff();

/// @nodoc
mixin _$NotificationsState {
  dynamic get page => throw _privateConstructorUsedError;
  dynamic get perPage => throw _privateConstructorUsedError;
  dynamic get pageCount => throw _privateConstructorUsedError;
  dynamic get totalCount => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<List<Order>> get ordersOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic page,
      dynamic perPage,
      dynamic pageCount,
      dynamic totalCount,
      dynamic status,
      bool isSubmitting,
      bool showErrorMessages,
      Option<List<Order>> ordersOption});
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  final NotificationsState _value;
  // ignore: unused_field
  final $Res Function(NotificationsState) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? pageCount = freezed,
    Object? totalCount = freezed,
    Object? status = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? ordersOption = freezed,
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
      ordersOption: ordersOption == freezed
          ? _value.ordersOption
          : ordersOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Order>>,
    ));
  }
}

/// @nodoc
abstract class _$NotificationsStateCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$NotificationsStateCopyWith(
          _NotificationsState value, $Res Function(_NotificationsState) then) =
      __$NotificationsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic page,
      dynamic perPage,
      dynamic pageCount,
      dynamic totalCount,
      dynamic status,
      bool isSubmitting,
      bool showErrorMessages,
      Option<List<Order>> ordersOption});
}

/// @nodoc
class __$NotificationsStateCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res>
    implements _$NotificationsStateCopyWith<$Res> {
  __$NotificationsStateCopyWithImpl(
      _NotificationsState _value, $Res Function(_NotificationsState) _then)
      : super(_value, (v) => _then(v as _NotificationsState));

  @override
  _NotificationsState get _value => super._value as _NotificationsState;

  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? pageCount = freezed,
    Object? totalCount = freezed,
    Object? status = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? ordersOption = freezed,
  }) {
    return _then(_NotificationsState(
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
      ordersOption: ordersOption == freezed
          ? _value.ordersOption
          : ordersOption // ignore: cast_nullable_to_non_nullable
              as Option<List<Order>>,
    ));
  }
}

/// @nodoc

class _$_NotificationsState extends _NotificationsState {
  _$_NotificationsState(
      {this.page = 1,
      this.perPage = 10,
      this.pageCount = 1,
      this.totalCount = 0,
      this.status = STATUS_IDLE,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      required this.ordersOption})
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
  final Option<List<Order>> ordersOption;

  @override
  String toString() {
    return 'NotificationsState(page: $page, perPage: $perPage, pageCount: $pageCount, totalCount: $totalCount, status: $status, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, ordersOption: $ordersOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationsState &&
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
                .equals(other.ordersOption, ordersOption));
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
      const DeepCollectionEquality().hash(ordersOption));

  @JsonKey(ignore: true)
  @override
  _$NotificationsStateCopyWith<_NotificationsState> get copyWith =>
      __$NotificationsStateCopyWithImpl<_NotificationsState>(this, _$identity);
}

abstract class _NotificationsState extends NotificationsState {
  factory _NotificationsState(
      {dynamic page,
      dynamic perPage,
      dynamic pageCount,
      dynamic totalCount,
      dynamic status,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<List<Order>> ordersOption}) = _$_NotificationsState;
  _NotificationsState._() : super._();

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
  Option<List<Order>> get ordersOption;
  @override
  @JsonKey(ignore: true)
  _$NotificationsStateCopyWith<_NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
