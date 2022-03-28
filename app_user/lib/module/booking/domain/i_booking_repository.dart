import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:app_user/core/core.dart';
import 'package:app_user/module/auth/auth.dart';
import '../../cart/domain/value_objects.dart';
import 'booking.dart';
import 'booking_failure.dart';

abstract class IBookingRepository {
  Future<Option<Booking>> detail(int id);
  Future<Either<BookingFailure, Unit>> delete(int id);
  Future<Either<BookingFailure, Unit>> cancel(int id);
  Future<Either<BookingFailure, Unit>> confirm(int id);
  Future<Either<BookingFailure, Unit>> update(dynamic order);
  Future<Option<Pagination<Booking>>> histories(
      {required int page, required int perPage});
  Future<Either<BookingFailure, Unit>> create(
      {required KtList<int> servicesId,
      required Name fullName,
      required Phone phoneNumber,
      required DateTime startTime,
      required String address,
      String? latitude,
      String? longitude,
      String? description,
      List6<String>? images});
}
