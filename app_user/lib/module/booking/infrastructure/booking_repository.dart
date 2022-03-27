import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/booking.dart';
import '../domain/booking_failure.dart';
import '../domain/i_booking_repository.dart';
import 'api/booking_api.dart';
import 'booking_mapper.dart';

class BookingRepository implements IBookingRepository {
  final Logger _logger;
  final BookingApi _bookingApi;

  BookingRepository(this._logger, this._bookingApi);

  @override
  Future<Option<Booking>> detail(int id) async {
    try {
      final response = await _bookingApi.detail(id);
      return optionOf(response.data!.toDomain());
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }

  @override
  Future<Either<BookingFailure, Unit>> delete(int id) async {
    try {
      await _bookingApi.delete(id);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const BookingFailure.unableDelete());
  }

  @override
  Future<Either<BookingFailure, Unit>> create(order) async {
    try {
      await _bookingApi.create(
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
  Future<Option<Pagination<Booking>>> histories(
      {required int page, required int perPage}) async {
    try {
      final response = await _bookingApi.bookings();
      final bookings = KtList.from(response.data!).map((item) {
        return item.toDomain();
      });

      return optionOf(Pagination<Booking>(
          page: 1,
          pageCount: 1,
          data: bookings,
          perPage: bookings.size,
          totalCount: bookings.size));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
