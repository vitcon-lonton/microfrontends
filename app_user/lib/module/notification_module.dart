import 'package:auth/auth.dart';

import 'package:injectable/injectable.dart';

@module
abstract class NotificationModule {
  @Injectable()
  NotificationsCubit get notificationsCubit;
}
