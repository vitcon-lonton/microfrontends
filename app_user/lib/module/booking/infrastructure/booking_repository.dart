import 'package:dartz/dartz.dart' hide Order;
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/booking_entities.dart';
import '../domain/booking_failure.dart';
import '../domain/i_booking_repository.dart';
import 'api/booking_api.dart';
import 'booking_mapper.dart';

class BookingRepository implements IBookingRepository {
  final Logger _logger;
  final BookingApi _api;

  BookingRepository(this._logger, this._api);

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
    try {
      final response = await _api.create(
          serviceId: 1,
          address: 'address',
          fullName: 'fullName',
          latitude: '10.7571445',
          longitude: '106.6880843',
          phoneNumber: '9999999999',
          timeBoxingEnd: '15/3/2022',
          timeBoxingStart: '1/3/2022',
          description: 'description',
          bookingImages: null);

      if (!response.valid) {
        return left(const BookingFailure.unableCreate());
      }

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const BookingFailure.unableCreate());
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
  Future<Option<Pagination<Booking>>> histories(
      {required int page, required int perPage}) async {
    try {
      final response = await _api.bookings();
      if (!response.valid) return none();

      final responseData = response.data!;
      final bookings = responseData.map((item) => item.toDomain()).toList();
      final result = Pagination<Booking>(
          data: bookings,
          page: 1,
          pageCount: 1,
          perPage: bookings.length,
          totalCount: bookings.length);

      return optionOf(result);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
