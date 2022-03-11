import 'package:app_user/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
part 'order_delete_cubit.freezed.dart';

@freezed
class OrderDeleteState with _$OrderDeleteState {
  const factory OrderDeleteState.initial() = _Initial;
  const factory OrderDeleteState.deleteSuccess() = _DeleteSuccess;
  const factory OrderDeleteState.actionInProgress() = _ActionInProgress;
  const factory OrderDeleteState.deleteFailure(BookingFailure failure) =
      _DeleteFailure;
}

class OrderDeleteCubit extends Cubit<OrderDeleteState> {
  OrderDeleteCubit(this._repository) : super(const OrderDeleteState.initial());

  final IBookingRepository _repository;

  Future<void> deleted(UniqueId id) async {
    emit(const OrderDeleteState.actionInProgress());
    final possibleFailure = await _repository.delete(id);
    emit(possibleFailure.fold(OrderDeleteState.deleteFailure,
        (_) => const OrderDeleteState.deleteSuccess()));
  }
}
