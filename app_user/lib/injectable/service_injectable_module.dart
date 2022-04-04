import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/service/service.dart';

@module
abstract class ServiceInjectableModule {
  @Injectable()
  ServicesCubit get services;

  @Injectable()
  ServiceDetailCubit get detail;

  @LazySingleton(as: IServiceRepository)
  ServiceRepository get repository;

  @LazySingleton()
  ServiceApi serviceApi(Dio dio) => ServiceApi(dio);
}
