import 'package:dartz/dartz.dart' hide Order;
import 'package:app_user/core/core.dart';
import '../domain/entities.dart';
import '../domain/failure.dart';
import '../domain/i_repository.dart';

class BookingRepository implements IBookingRepository {
  late final Duration _duration;

  BookingRepository() {
    _duration = const Duration(milliseconds: 700);
  }

  @override
  Future<Option<Pagination<Order>>> getOrderHistories(
      {required int page, required int perPage}) async {
    await Future.delayed(_duration);

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

  @override
  Future<Option<Order>> getOrder() async {
    await Future.delayed(_duration);
    return optionOf(Order.random());
  }

  @override
  Future<Either<BookingFailure, Unit>> cancel({UniqueId? id}) async {
    await Future.delayed(_duration);
    return right(unit);
  }

  @override
  Future<Either<BookingFailure, Unit>> rating(
      {UniqueId? id, required double point}) async {
    await Future.delayed(_duration);

    if (point < 0.0 || point > 5.0) {
      return left(const BookingFailure.serverError());
    }

    return right(unit);
  }
}


// await Future.delayed(const Duration(milliseconds: 400));
// final data = List.generate(10, (i) => Order.random());
// return optionOf(data);