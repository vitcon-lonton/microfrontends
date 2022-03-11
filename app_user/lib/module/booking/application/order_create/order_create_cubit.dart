import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/booking_failure.dart';
import '../../domain/i_booking_repository.dart';
part 'order_create_cubit.freezed.dart';

@freezed
class OrderCreateState with _$OrderCreateState {
  const factory OrderCreateState.initial() = _Initial;
  const factory OrderCreateState.createSuccess() = _CreateSuccess;
  const factory OrderCreateState.actionInProgress() = _ActionInProgress;
  const factory OrderCreateState.createFailure(BookingFailure failure) =
      _CreateFailure;
}

class OrderCreateCubit extends Cubit<OrderCreateState> {
  OrderCreateCubit(this._repository) : super(const OrderCreateState.initial());

  final IBookingRepository _repository;

  Future<void> created(dynamic order) async {
    emit(const OrderCreateState.actionInProgress());
    final possibleFailure = await _repository.create(order);
    emit(possibleFailure.fold(OrderCreateState.createFailure,
        (_) => const OrderCreateState.createSuccess()));
  }
}
