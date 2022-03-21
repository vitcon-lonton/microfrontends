/* spell-checker: disable */
import 'package:dartz/dartz.dart' hide Order;
import 'package:kt_dart/collection.dart';
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/i_notification_repository.dart';
import '../domain/notification.dart';

class NotificationRepository implements INotificationRepository {
  final Logger _logger;

  NotificationRepository(this._logger);

  @override
  Future<Option<Pagination<Notification>>> all(
      {required int page, required int perPage}) async {
    try {
      await Future.delayed(const Duration(milliseconds: 400));

      int pageCount;
      int totalCount;
      KtList<Notification> data;

      pageCount = 5;
      totalCount = perPage * 5;
      data = KtList.from(List.generate(perPage, (i) => Notification.random()));

      return optionOf(Pagination<Notification>(
          data: data,
          page: page,
          perPage: perPage,
          pageCount: pageCount,
          totalCount: totalCount));
    } catch (e) {
      _logger.e(e);
    }

    return none();
  }
}
