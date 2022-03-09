import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/notification/notification.dart';

@module
abstract class NotificationModule {
  @LazySingleton(as: INotificationRepository)
  NotificationRepository get repository;

  @Injectable()
  NotificationsCubit get notificationsCubit;

  @LazySingleton()
  NotificationApi api(Dio dio) => NotificationApi(dio);
}
