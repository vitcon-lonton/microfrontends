import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/booking.dart';

part 'order_rating_cubit.freezed.dart';

@freezed
class OrderRatingState with _$OrderRatingState {
  const OrderRatingState._();

  factory OrderRatingState({
    @Default(5.0) double point,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<Either<BookingFailure, Unit>> failureOrSuccessOption,
  }) = _OrderRatingState;

  factory OrderRatingState.init() =>
      OrderRatingState(failureOrSuccessOption: none());
}

class OrderRatingCubit extends Cubit<OrderRatingState> {
  final IBookingRepository _repository;

  OrderRatingCubit(this._repository) : super(OrderRatingState.init());

  void refreshRequested() => emit(OrderRatingState.init());

  void pointChanged(double value) => emit(state.copyWith(point: value));

  Future<void> submitted() async {
    emit(state.copyWith(isSubmitting: true));

    final failureOrSuccess = await _repository.rating(point: state.point);

    emit(state.copyWith(isSubmitting: false));
    emit(state.copyWith(failureOrSuccessOption: optionOf(failureOrSuccess)));
  }
}
