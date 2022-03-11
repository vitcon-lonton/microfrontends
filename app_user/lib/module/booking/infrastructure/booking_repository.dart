import 'package:dartz/dartz.dart' hide Order;
import 'package:app_user/core/core.dart';
import '../domain/booking_failure.dart';
import '../domain/i_booking_repository.dart';
import '../domain/order.dart';

class BookingRepository implements IBookingRepository {
  @override
  Future<Option<Order>> detail(UniqueId id) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return optionOf(Order.random());
  }

  @override
  Future<Either<BookingFailure, Unit>> delete(UniqueId id) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return right(unit);
  }

  @override
  Future<Either<BookingFailure, Unit>> create(order) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return right(unit);
  }

  @override
  Future<Either<BookingFailure, Unit>> update(order) async {
    await Future.delayed(const Duration(milliseconds: 700));
    return right(unit);
  }

  @override
  Future<Either<BookingFailure, Unit>> rating(
      {UniqueId? id, required double point}) async {
    await Future.delayed(const Duration(milliseconds: 700));

    if (point < 0.0 || point > 5.0) {
      return left(const BookingFailure.unexpected());
    }

    return right(unit);
  }

  @override
  Future<Option<Pagination<Order>>> histories(
      {required int page, required int perPage}) async {
    await Future.delayed(const Duration(milliseconds: 700));

    const pageCount = 5;
    final totalCount = perPage * 5;
    final data = List.generate(perPage, (index) => Order.random());

    final result = Pagination<Order>(
        data: data,
        page: page,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount);

    return optionOf(result);
  }
}
