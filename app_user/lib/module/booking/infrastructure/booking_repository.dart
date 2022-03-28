import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import 'package:app_user/module/auth/domain/value_objects.dart';
import 'package:app_user/module/cart/domain/value_objects.dart';
import '../domain/booking.dart';
import '../domain/booking_failure.dart';
import '../domain/i_booking_repository.dart';
import 'api/booking_api.dart';
import 'booking_mapper.dart';

class BookingRepository implements IBookingRepository {
  BookingRepository(this._logger, this._bookingApi);

  final Logger _logger;
  final BookingApi _bookingApi;

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
  Future<Either<BookingFailure, Unit>> cancel(int id) async {
    try {
      await _bookingApi.cancelled(id);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const BookingFailure.unableCancel());
  }

  @override
  Future<Either<BookingFailure, Unit>> confirm(int id) async {
    try {
      await _bookingApi.confirm(id);
      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const BookingFailure.unableConfirm());
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

  @override
  Future<Either<BookingFailure, Unit>> create(
      {required KtList<int> servicesId,
      required Name fullName,
      required Phone phoneNumber,
      required DateTime startTime,
      required String address,
      String? latitude,
      String? longitude,
      String? description,
      List6<String>? images}) async {
    final addressStr = address;
    final fullNameStr = fullName.getOrCrash();
    final phoneStr = phoneNumber.getOrCrash();
    final latitudeStr = latitude ?? '10.7571445';
    final longitudeStr = longitude ?? '106.6880843';
    final startTimeStr = startTime.toIso8601String();
    final descriptionStr = description ?? 'Description';
    final servicesIdStr = servicesId.joinToString(separator: ',');
    final imagesStr = images?.getOrCrash().joinToString(separator: ',');

    try {
      await _bookingApi.create(
          serviceIds: servicesIdStr,
          address: addressStr,
          phoneNumber: phoneStr,
          fullName: fullNameStr,
          latitude: latitudeStr,
          longitude: longitudeStr,
          description: descriptionStr,
          timeBoxingStart: startTimeStr,
          images: imagesStr);

      return right(unit);
    } catch (e) {
      _logger.e(e);
    }

    return left(const BookingFailure.unableCreate());
  }
}

// await _bookingApi.create(
//     serviceIds: '16,15',
//     address: 'address',
//     fullName: 'fullName',
//     latitude: '10.7571445',
//     longitude: '106.6880843',
//     phoneNumber: '9999999999',
//     description: 'description',
//     timeBoxingEnd: endTime.toIso8601String(),
//     timeBoxingStart: startTime.toIso8601String(),
//     images: null);