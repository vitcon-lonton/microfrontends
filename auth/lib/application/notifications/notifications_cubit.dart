import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/processing_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:auth/domain/i_auth_facade.dart';
import 'package:auth/domain/user.dart';

part 'notifications_cubit.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const NotificationsState._();

  factory NotificationsState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(STATUS_IDLE) status,
    @Default(false) bool isSubmitting,
    @Default(true) bool showErrorMessages,
    required Option<List<Order>> ordersOption,
  }) = _NotificationsState;

  bool get isLastPage => page == pageCount;

  NotificationsState busy() => copyWith(status: STATUS_BUSY);
  NotificationsState idle() => copyWith(status: STATUS_IDLE);
  NotificationsState failed() => copyWith(status: STATUS_FAILED);
  NotificationsState complete() => copyWith(status: STATUS_COMPLETE);

  factory NotificationsState.init() {
    return NotificationsState(ordersOption: none());
  }
}

class NotificationsCubit extends Cubit<NotificationsState> {
  final IAuthFacade _authFacade;

  NotificationsCubit(this._authFacade) : super(NotificationsState.init());

  refreshRequested() => emit(NotificationsState.init());

  pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getNotificationsRequested() async {
    emit(state.copyWith(isSubmitting: true));

    final page = state.page;
    final perPage = state.perPage;
    final resultOption =
        await _authFacade.getNotifications(page: page, perPage: perPage);

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
