/* spell-checker: disable */
import 'package:dartz/dartz.dart' hide Order;
import 'package:logger/logger.dart';
import 'package:app_user/core/core.dart';
import '../domain/i_repository.dart';
import '../domain/notification.dart';

class NotificationRepository implements INotificationRepository {
  // ignore: unused_field
  final Logger _logger;

  NotificationRepository(this._logger);

  @override
  Future<Option<Pagination<Notification>>> getNotifications(
      {required int page, required int perPage}) async {
    await Future.delayed(const Duration(milliseconds: 400));

    const pageCount = 5;
    final totalCount = perPage * 5;
    final data = List.generate(perPage, (index) => Notification.random());

    final result = Pagination<Notification>(
        data: data,
        page: page,
        perPage: perPage,
        pageCount: pageCount,
        totalCount: totalCount);

    return optionOf(result);
  }
}
