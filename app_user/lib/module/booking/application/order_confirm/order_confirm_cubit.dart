import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
part 'order_confirm_cubit.freezed.dart';

@freezed
class OrderConfirmState with _$OrderConfirmState {
  const factory OrderConfirmState.initial() = _Initial;
  const factory OrderConfirmState.confirmSuccess() = _ConfirmSuccess;
  const factory OrderConfirmState.actionInProgress() = _ActionInProgress;
  const factory OrderConfirmState.confirmFailure(BookingFailure failure) =
      _ConfirmFailure;
}

class OrderConfirmCubit extends Cubit<OrderConfirmState> {
  OrderConfirmCubit(this._repository)
      : super(const OrderConfirmState.initial());

  final IBookingRepository _repository;

  Future<void> confirmed() async {
    emit(const OrderConfirmState.actionInProgress());
    final possibleFailure = await _repository.update({});
    emit(possibleFailure.fold(OrderConfirmState.confirmFailure,
        (_) => const OrderConfirmState.confirmSuccess()));
  }
}
