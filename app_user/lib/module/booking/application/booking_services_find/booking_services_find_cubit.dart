import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:app_user/module/booking/infrastructure/infrastructure.dart';
part 'booking_services_find_cubit.freezed.dart';

@freezed
class BookingServicesFindState with _$BookingServicesFindState {
  const factory BookingServicesFindState.initial() = _Initial;
  const factory BookingServicesFindState.notFound() = _NotFound;
  const factory BookingServicesFindState.inProgress() = _InProgress;
  const factory BookingServicesFindState.founded(KtList<int> ids) = _Founded;
}

class BookingServicesFindCubit extends Cubit<BookingServicesFindState> {
  BookingServicesFindCubit(this._logger, this._bookingApi)
      : super(const BookingServicesFindState.initial());

  final Logger _logger;
  final BookingApi _bookingApi;

  Future<void> findRequested(int bookingId) async {
    emit(const BookingServicesFindState.inProgress());
    Option<KtList<int>> possibleData = await _performGetServices(bookingId);
    emit(possibleData.fold(() {
      return const BookingServicesFindState.notFound();
    }, (ids) => BookingServicesFindState.founded(ids)));
  }

  Future<Option<KtList<int>>> _performGetServices(int bookingId) async {
    try {
      final response = await _bookingApi.getServiceIds(bookingId);
      return optionOf(KtList.from(response.data!.serviceIds));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
