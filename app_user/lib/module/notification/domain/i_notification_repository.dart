import 'package:dartz/dartz.dart' hide Order;
import 'package:app_user/core/core.dart';

import 'notification.dart';

abstract class INotificationRepository {
  Future<Option<Pagination<Notification>>> all(
      {required int page, required int perPage});
}
