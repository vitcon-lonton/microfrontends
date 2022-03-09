import 'package:injectable/injectable.dart';
import 'package:app_user/module/auth/auth.dart';

@module
abstract class NotificationModule {
  @Injectable()
  NotificationsCubit get notificationsCubit;
}
