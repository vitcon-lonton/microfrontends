// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_histories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrderHistoriesStateTearOff {
  const _$OrderHistoriesStateTearOff();

  _OrderHistoriesState call(
      {dynamic page = 1,
      dynamic perPage = 10,
      dynamic pageCount = 1,
      dynamic totalCount = 0,
      dynamic status = STATUS_IDLE,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      required Option<List<Order>> ordersOption}) {
    return _OrderHistoriesState(
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
const $OrderHistoriesState = _$OrderHistoriesStateTearOff();

/// @nodoc
mixin _$OrderHistoriesState {
  dynamic get page => throw _privateConstructorUsedError;
  dynamic get perPage => throw _privateConstructorUsedError;
  dynamic get pageCount => throw _privateConstructorUsedError;
  dynamic get totalCount => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  Option<List<Order>> get ordersOption => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoriesStateCopyWith<OrderHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoriesStateCopyWith<$Res> {
  factory $OrderHistoriesStateCopyWith(
          OrderHistoriesState value, $Res Function(OrderHistoriesState) then) =
      _$OrderHistoriesStateCopyWithImpl<$Res>;
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
class _$OrderHistoriesStateCopyWithImpl<$Res>
    implements $OrderHistoriesStateCopyWith<$Res> {
  _$OrderHistoriesStateCopyWithImpl(this._value, this._then);

  final OrderHistoriesState _value;
  // ignore: unused_field
  final $Res Function(OrderHistoriesState) _then;

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
abstract class _$OrderHistoriesStateCopyWith<$Res>
    implements $OrderHistoriesStateCopyWith<$Res> {
  factory _$OrderHistoriesStateCopyWith(_OrderHistoriesState value,
          $Res Function(_OrderHistoriesState) then) =
      __$OrderHistoriesStateCopyWithImpl<$Res>;
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
class __$OrderHistoriesStateCopyWithImpl<$Res>
    extends _$OrderHistoriesStateCopyWithImpl<$Res>
    implements _$OrderHistoriesStateCopyWith<$Res> {
  __$OrderHistoriesStateCopyWithImpl(
      _OrderHistoriesState _value, $Res Function(_OrderHistoriesState) _then)
      : super(_value, (v) => _then(v as _OrderHistoriesState));

  @override
  _OrderHistoriesState get _value => super._value as _OrderHistoriesState;

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
    return _then(_OrderHistoriesState(
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

class _$_OrderHistoriesState extends _OrderHistoriesState {
  _$_OrderHistoriesState(
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
    return 'OrderHistoriesState(page: $page, perPage: $perPage, pageCount: $pageCount, totalCount: $totalCount, status: $status, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, ordersOption: $ordersOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderHistoriesState &&
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
  _$OrderHistoriesStateCopyWith<_OrderHistoriesState> get copyWith =>
      __$OrderHistoriesStateCopyWithImpl<_OrderHistoriesState>(
          this, _$identity);
}

abstract class _OrderHistoriesState extends OrderHistoriesState {
  factory _OrderHistoriesState(
      {dynamic page,
      dynamic perPage,
      dynamic pageCount,
      dynamic totalCount,
      dynamic status,
      bool isSubmitting,
      bool showErrorMessages,
      required Option<List<Order>> ordersOption}) = _$_OrderHistoriesState;
  _OrderHistoriesState._() : super._();

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
  _$OrderHistoriesStateCopyWith<_OrderHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}
