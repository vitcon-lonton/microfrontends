import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/pagination.dart';
import 'package:engine/processing_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:booking/booking.dart';

part 'order_histories_cubit.freezed.dart';

@freezed
class OrderHistoriesState with _$OrderHistoriesState {
  const OrderHistoriesState._();

  factory OrderHistoriesState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(STATUS_IDLE) status,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<List<Order>> ordersOption,
  }) = _OrderHistoriesState;

  bool get isLastPage => page == pageCount;

  List<Order> get orders {
    return List.of(ordersOption.foldRight(<Order>[], (orders, prev) {
      return orders;
    }));
  }

  OrderHistoriesState busy() => copyWith(status: STATUS_BUSY);
  OrderHistoriesState idle() => copyWith(status: STATUS_IDLE);
  OrderHistoriesState failed() => copyWith(status: STATUS_FAILED);
  OrderHistoriesState complete() => copyWith(status: STATUS_COMPLETE);

  factory OrderHistoriesState.init() {
    return OrderHistoriesState(ordersOption: none());
  }
}

class OrderHistoriesCubit extends Cubit<OrderHistoriesState> {
  final IBookingRepository _repository;

  OrderHistoriesCubit(this._repository) : super(OrderHistoriesState.init());

  Future<Option<Pagination<Order>>> _performGetOrders() {
    return _repository.getOrderHistories(
        page: state.page, perPage: state.perPage);
  }

  Future<void> getOrdersRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final result = await _performGetOrders();

    result.fold(() {}, (pagination) {
      final currentOrders = state.orders;
      final newOrders = currentOrders..addAll(pagination.data);

      emit(state.copyWith(
          page: pagination.page,
          perPage: pagination.perPage,
          pageCount: pagination.pageCount,
          totalCount: pagination.totalCount,
          ordersOption: optionOf(newOrders)));
    });

    emit(state.copyWith(isSubmitting: false));
  }

  void refreshRequested() => emit(OrderHistoriesState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));
}
