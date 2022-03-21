import 'package:dartz/dartz.dart' hide Order;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:app_user/core/core.dart';
import '../../domain/i_notification_repository.dart';
import '../../domain/notification.dart';
part 'notifications_cubit.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const NotificationsState._();
  factory NotificationsState(
          {@Default(1) page,
          @Default(10) perPage,
          @Default(1) pageCount,
          @Default(0) totalCount,
          @Default(false) bool isLoading,
          required Option<KtList<Notification>> notificationsOption}) =
      _NotificationsState;

  factory NotificationsState.init() =>
      NotificationsState(notificationsOption: none());

  KtList<Notification> get notifications {
    return notificationsOption.getOrElse(emptyList);
  }

  bool get isLastPage => page == pageCount;
}

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._repository) : super(NotificationsState.init());

  final INotificationRepository _repository;

  void refreshRequested() => emit(NotificationsState.init());

  void pageNumberChanged(int value) => emit(state.copyWith(page: value));

  Future<void> getNotificationsRequested() async {
    emit(state.copyWith(isLoading: true));

    Option<Pagination<Notification>> possibleData;
    possibleData = await _performGetNotifications();
    possibleData.fold(() {}, (pagination) {
      emit(state.copyWith(
        page: pagination.page,
        perPage: pagination.perPage,
        pageCount: pagination.pageCount,
        totalCount: pagination.totalCount,
        notificationsOption:
            optionOf(state.notifications.plus(pagination.data)),
      ));
    });

    emit(state.copyWith(isLoading: false));
  }

  Future<Option<Pagination<Notification>>> _performGetNotifications() {
    return _repository.all(page: state.page, perPage: state.perPage);
  }
}
