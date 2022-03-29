import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:app_user/module/booking/infrastructure/infrastructure.dart';
part 'booking_technician_find_cubit.freezed.dart';

@freezed
class BookingTechnicianFindState with _$BookingTechnicianFindState {
  const factory BookingTechnicianFindState.initial() = _Initial;
  const factory BookingTechnicianFindState.notFound() = _NotFound;
  const factory BookingTechnicianFindState.inProgress() = _InProgress;
  const factory BookingTechnicianFindState.founded(TechnicianDto technician) =
      _Founded;
}

class BookingTechnicianFindCubit extends Cubit<BookingTechnicianFindState> {
  BookingTechnicianFindCubit(this._logger, this._bookingApi)
      : super(const BookingTechnicianFindState.initial());

  final Logger _logger;
  final BookingApi _bookingApi;

  Future<void> findRequested(int bookingId) async {
    emit(const BookingTechnicianFindState.inProgress());
    Option<TechnicianDto> possibleData = await _performGetTechnician(bookingId);
    emit(possibleData.fold(() {
      return const BookingTechnicianFindState.notFound();
    }, (technician) => BookingTechnicianFindState.founded(technician)));
  }

  Future<Option<TechnicianDto>> _performGetTechnician(int bookingId) async {
    try {
      final response = await _bookingApi.technicianInfo(bookingId);
      return optionOf(response.data);
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
