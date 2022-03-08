import 'package:injectable/injectable.dart';
import 'package:app_user/auth/auth.dart';

@module
abstract class NotificationModule {
  @Injectable()
  NotificationsCubit get notificationsCubit;
}
