import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/notification/notification.dart';

@module
abstract class NotificationInjectableModule {
  @Injectable()
  NotificationsCubit get notifications;

  @LazySingleton(as: INotificationRepository)
  NotificationRepository get repository;

  @LazySingleton()
  NotificationApi api(Dio dio) => NotificationApi(dio);
}
