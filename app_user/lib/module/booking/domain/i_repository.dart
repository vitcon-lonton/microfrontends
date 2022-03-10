import 'package:dartz/dartz.dart' hide Order;
import 'package:app_user/core/core.dart';

import 'entities.dart';
import 'failure.dart';

abstract class IBookingRepository {
  Future<Option<Order>> getOrder();
  Future<Option<Pagination<Order>>> getOrderHistories(
      {required int page, required int perPage});
  Future<Either<BookingFailure, Unit>> cancel({UniqueId? id});
  Future<Either<BookingFailure, Unit>> rating(
      {UniqueId? id, required double point});
}
