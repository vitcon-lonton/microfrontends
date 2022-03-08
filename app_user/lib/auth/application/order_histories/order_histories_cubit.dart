import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/processing_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/auth/domain/i_auth_facade.dart';
import 'package:app_user/auth/domain/user.dart';

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

  OrderHistoriesState busy() => copyWith(status: STATUS_BUSY);
  OrderHistoriesState idle() => copyWith(status: STATUS_IDLE);
  OrderHistoriesState failed() => copyWith(status: STATUS_FAILED);
  OrderHistoriesState complete() => copyWith(status: STATUS_COMPLETE);

  factory OrderHistoriesState.init() {
    return OrderHistoriesState(ordersOption: none());
  }
}

class OrderHistoriesCubit extends Cubit<OrderHistoriesState> {
  final IAuthFacade _authFacade;

  OrderHistoriesCubit(this._authFacade) : super(OrderHistoriesState.init());

  @override
  void onChange(Change<OrderHistoriesState> change) {
    super.onChange(change);
    // print(
    //   change.nextState.ordersOption.foldRight([], (a, previous) => a.length),
    // );
  }

  refreshRequested() => emit(OrderHistoriesState.init());

  pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getOrdersRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final page = state.page;
    final perPage = state.perPage;
    final resultOption =
        await _authFacade.getOrderHistories(page: page, perPage: perPage);

    resultOption.fold(() {}, (pagination) {
      final ordersOption = state.ordersOption;
      final currentOrders =
          ordersOption.foldRight(<Order>[], (orders, previous) => orders);
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
}
