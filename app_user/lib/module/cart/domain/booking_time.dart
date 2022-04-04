import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'cart_failure.dart';
part 'booking_time.freezed.dart';

@freezed
class BookingTime with _$BookingTime {
  const BookingTime._();

  const factory BookingTime(
      {required DateTime date,
      required TimeOfDay timeStart,
      required TimeOfDay timeEnd}) = _BookingTime;

  Option<CartFailure> get failureOption {
    final now = DateTime.now();
    final startDateTime = DateTime(
        date.year, date.month, date.day, timeStart.hour, timeStart.minute);
    final endDateTime =
        DateTime(date.year, date.month, date.day, timeEnd.hour, timeEnd.minute);

    if (startDateTime.isBefore(now)) {
      return optionOf(const CartFailure.bookingTimeInvalid());
    }

    if (startDateTime.isAfter(endDateTime)) {
      return optionOf(const CartFailure.bookingTimeInvalid());
    }

    return none();
  }

  factory BookingTime.empty() {
    final now = DateTime.now();

    return BookingTime(
        date: now,
        timeStart: TimeOfDay(hour: now.hour + 1, minute: 0),
        timeEnd: TimeOfDay(hour: now.hour + 2, minute: 0));
  }
}
