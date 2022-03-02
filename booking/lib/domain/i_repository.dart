import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/engine.dart';

import 'entities.dart';

abstract class IBookingRepository {
  Future<Option<Pagination<Order>>> getOrderHistories(
      {required int page, required int perPage});
}
