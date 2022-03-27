import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:app_user/module/booking/infrastructure/infrastructure.dart';
part 'technician_info_cubit.freezed.dart';

@freezed
class TechnicianInfoState with _$TechnicianInfoState {
  const factory TechnicianInfoState.initial() = _Initial;
  const factory TechnicianInfoState.notFound() = _NotFound;
  const factory TechnicianInfoState.inProgress() = _InProgress;
  const factory TechnicianInfoState.founded(TechnicianDto technician) =
      _Founded;
}

class TechnicianInfoCubit extends Cubit<TechnicianInfoState> {
  TechnicianInfoCubit(this._logger, this._bookingApi)
      : super(const TechnicianInfoState.initial());

  final Logger _logger;
  final BookingApi _bookingApi;

  Future<void> getTechnicianRequested(int bookingId) async {
    emit(const TechnicianInfoState.inProgress());
    Option<TechnicianDto> possibleData = await _performGetTechnician(bookingId);
    emit(possibleData.fold(() {
      return const TechnicianInfoState.notFound();
    }, (technician) => TechnicianInfoState.founded(technician)));
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
