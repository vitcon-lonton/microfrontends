import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'booking.dart';
import 'booking_failure.dart';

abstract class IBookingRepository {
  Future<Option<Booking>> detail(int id);
  Future<Either<BookingFailure, Unit>> delete(int id);
  Future<Either<BookingFailure, Unit>> create(dynamic order);
  Future<Either<BookingFailure, Unit>> update(dynamic order);
  Future<Option<Pagination<Booking>>> histories(
      {required int page, required int perPage});
}
