import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_user/core/core.dart';
import '../../domain/i_repository.dart';
import '../../domain/notification.dart';
part 'notifications_cubit.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const NotificationsState._();

  factory NotificationsState({
    @Default(1) page,
    @Default(10) perPage,
    @Default(1) pageCount,
    @Default(0) totalCount,
    @Default(false) bool isLoading,
    @Default(true) bool showErrorMessages,
    required Option<List<Notification>> notificationsOption,
  }) = _NotificationsState;

  List<Notification> get notifications {
    return List.of(notificationsOption
        .foldRight(<Notification>[], (notifications, prev) => notifications));
  }

  bool get isLastPage => page == pageCount;

  factory NotificationsState.init() {
    return NotificationsState(notificationsOption: none());
  }
}

class NotificationsCubit extends Cubit<NotificationsState> {
  final INotificationRepository _repository;

  NotificationsCubit(this._repository) : super(NotificationsState.init());

  void refreshRequested() => emit(NotificationsState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getNotificationsRequested() async {
    emit(state.copyWith(isLoading: true));

    final resultOption = await _performGetNotifications();

    resultOption.fold(() {}, (pagination) {
      final notifications = state.notifications;
      final newNotifications = notifications..addAll(pagination.data);

      emit(state.copyWith(
          page: pagination.page,
          perPage: pagination.perPage,
          pageCount: pagination.pageCount,
          totalCount: pagination.totalCount,
          notificationsOption: optionOf(newNotifications)));
    });

    emit(state.copyWith(isLoading: false));
  }

  Future<Option<Pagination<Notification>>> _performGetNotifications() {
    final page = state.page;
    final perPage = state.perPage;

    return _repository.getNotifications(page: page, perPage: perPage);
  }
}
