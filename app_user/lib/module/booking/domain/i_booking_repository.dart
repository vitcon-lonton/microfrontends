import 'package:dartz/dartz.dart' hide Order;
import 'package:app_user/core/core.dart';

import 'order.dart';
import 'booking_failure.dart';

abstract class IBookingRepository {
  Future<Option<Order>> detail(UniqueId id);
  Future<Either<BookingFailure, Unit>> delete(UniqueId id);
  Future<Either<BookingFailure, Unit>> create(dynamic order);
  Future<Either<BookingFailure, Unit>> update(dynamic order);
  Future<Either<BookingFailure, Unit>> rating(
      {UniqueId? id, required double point});
  Future<Option<Pagination<Order>>> histories(
      {required int page, required int perPage});
}
