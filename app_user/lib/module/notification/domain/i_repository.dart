import 'package:dartz/dartz.dart' hide Order;
import 'package:engine/engine.dart';

import 'notification.dart';

abstract class INotificationRepository {
  Future<Option<Pagination<Notification>>> getNotifications(
      {required int page, required int perPage});
}
