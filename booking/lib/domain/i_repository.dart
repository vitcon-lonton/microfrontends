import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/engine.dart';

import 'entities.dart';
import 'failure.dart';

abstract class IBookingRepository {
  Future<Option<List<CartItem>>> getCart();
  Future<Either<BookingFailure, Unit>> removeItem(UniqueId id);
  Future<Either<BookingFailure, Unit>> addItem({required CartItem item});
  Future<Option<Order>> getOrder();
  Future<Option<Pagination<Order>>> getOrderHistories(
      {required int page, required int perPage});
  Future<Either<BookingFailure, Unit>> cancel({UniqueId? id});
}
