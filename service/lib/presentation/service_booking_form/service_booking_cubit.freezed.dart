// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServiceBookingFormStateTearOff {
  const _$ServiceBookingFormStateTearOff();

  _ServiceBookingFormState call(
      {Service? service,
      required Note note,
      required Street street,
      required DateTime date,
      required DateTime time,
      bool isSubmitting = false,
      bool showErrorMessages = true,
      ProcessingStatus status = const ProcessingStatus.idle(),
      required Option<Either<ServiceFailure, Unit>>
          bookingFailureOrSuccessOption}) {
    return _ServiceBookingFormState(
      service: service,
      note: note,
      street: street,
      date: date,
      time: time,
      isSubmitting: isSubmitting,
      showErrorMessages: showErrorMessages,
      status: status,
      bookingFailureOrSuccessOption: bookingFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $ServiceBookingFormState = _$ServiceBookingFormStateTearOff();

/// @nodoc
mixin _$ServiceBookingFormState {
  Service? get service => throw _privateConstructorUsedError;
  Note get note => throw _privateConstructorUsedError;
  Street get street => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  ProcessingStatus get status => throw _privateConstructorUsedError;
  Option<Either<ServiceFailure, Unit>> get bookingFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceBookingFormStateCopyWith<ServiceBookingFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceBookingFormStateCopyWith<$Res> {
  factory $ServiceBookingFormStateCopyWith(ServiceBookingFormState value,
          $Res Function(ServiceBookingFormState) then) =
      _$ServiceBookingFormStateCopyWithImpl<$Res>;
  $Res call(
      {Service? service,
      Note note,
      Street street,
      DateTime date,
      DateTime time,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<ServiceFailure, Unit>> bookingFailureOrSuccessOption});

  $ServiceCopyWith<$Res>? get service;
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$ServiceBookingFormStateCopyWithImpl<$Res>
    implements $ServiceBookingFormStateCopyWith<$Res> {
  _$ServiceBookingFormStateCopyWithImpl(this._value, this._then);

  final ServiceBookingFormState _value;
  // ignore: unused_field
  final $Res Function(ServiceBookingFormState) _then;

  @override
  $Res call({
    Object? service = freezed,
    Object? note = freezed,
    Object? street = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? bookingFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as Street,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      bookingFailureOrSuccessOption: bookingFailureOrSuccessOption == freezed
          ? _value.bookingFailureOrSuccessOption
          : bookingFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, Unit>>,
    ));
  }

  @override
  $ServiceCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $ServiceCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value));
    });
  }

  @override
  $ProcessingStatusCopyWith<$Res> get status {
    return $ProcessingStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$ServiceBookingFormStateCopyWith<$Res>
    implements $ServiceBookingFormStateCopyWith<$Res> {
  factory _$ServiceBookingFormStateCopyWith(_ServiceBookingFormState value,
          $Res Function(_ServiceBookingFormState) then) =
      __$ServiceBookingFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Service? service,
      Note note,
      Street street,
      DateTime date,
      DateTime time,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      Option<Either<ServiceFailure, Unit>> bookingFailureOrSuccessOption});

  @override
  $ServiceCopyWith<$Res>? get service;
  @override
  $ProcessingStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$ServiceBookingFormStateCopyWithImpl<$Res>
    extends _$ServiceBookingFormStateCopyWithImpl<$Res>
    implements _$ServiceBookingFormStateCopyWith<$Res> {
  __$ServiceBookingFormStateCopyWithImpl(_ServiceBookingFormState _value,
      $Res Function(_ServiceBookingFormState) _then)
      : super(_value, (v) => _then(v as _ServiceBookingFormState));

  @override
  _ServiceBookingFormState get _value =>
      super._value as _ServiceBookingFormState;

  @override
  $Res call({
    Object? service = freezed,
    Object? note = freezed,
    Object? street = freezed,
    Object? date = freezed,
    Object? time = freezed,
    Object? isSubmitting = freezed,
    Object? showErrorMessages = freezed,
    Object? status = freezed,
    Object? bookingFailureOrSuccessOption = freezed,
  }) {
    return _then(_ServiceBookingFormState(
      service: service == freezed
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      street: street == freezed
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as Street,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      bookingFailureOrSuccessOption: bookingFailureOrSuccessOption == freezed
          ? _value.bookingFailureOrSuccessOption
          : bookingFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ServiceFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_ServiceBookingFormState extends _ServiceBookingFormState {
  _$_ServiceBookingFormState(
      {this.service,
      required this.note,
      required this.street,
      required this.date,
      required this.time,
      this.isSubmitting = false,
      this.showErrorMessages = true,
      this.status = const ProcessingStatus.idle(),
      required this.bookingFailureOrSuccessOption})
      : super._();

  @override
  final Service? service;
  @override
  final Note note;
  @override
  final Street street;
  @override
  final DateTime date;
  @override
  final DateTime time;
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
  final Option<Either<ServiceFailure, Unit>> bookingFailureOrSuccessOption;

  @override
  String toString() {
    return 'ServiceBookingFormState(service: $service, note: $note, street: $street, date: $date, time: $time, isSubmitting: $isSubmitting, showErrorMessages: $showErrorMessages, status: $status, bookingFailureOrSuccessOption: $bookingFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceBookingFormState &&
            const DeepCollectionEquality().equals(other.service, service) &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality().equals(other.street, street) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(
                other.bookingFailureOrSuccessOption,
                bookingFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(service),
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(street),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(isSubmitting),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(bookingFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$ServiceBookingFormStateCopyWith<_ServiceBookingFormState> get copyWith =>
      __$ServiceBookingFormStateCopyWithImpl<_ServiceBookingFormState>(
          this, _$identity);
}

abstract class _ServiceBookingFormState extends ServiceBookingFormState {
  factory _ServiceBookingFormState(
      {Service? service,
      required Note note,
      required Street street,
      required DateTime date,
      required DateTime time,
      bool isSubmitting,
      bool showErrorMessages,
      ProcessingStatus status,
      required Option<Either<ServiceFailure, Unit>>
          bookingFailureOrSuccessOption}) = _$_ServiceBookingFormState;
  _ServiceBookingFormState._() : super._();

  @override
  Service? get service;
  @override
  Note get note;
  @override
  Street get street;
  @override
  DateTime get date;
  @override
  DateTime get time;
  @override
  bool get isSubmitting;
  @override
  bool get showErrorMessages;
  @override
  ProcessingStatus get status;
  @override
  Option<Either<ServiceFailure, Unit>> get bookingFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$ServiceBookingFormStateCopyWith<_ServiceBookingFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
