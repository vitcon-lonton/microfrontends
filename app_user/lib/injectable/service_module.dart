import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/service/service.dart';

@module
abstract class ServiceModule {
  @Injectable()
  ServicesCubit get servicesCubit;

  @Injectable()
  CategoriesCubit get categoriesCubit;

  @Injectable()
  ServiceDetailCubit get serviceDetailCubit;

  @Injectable()
  ServiceCheckingCubit get serviceCheckingCubit;

  @LazySingleton(as: IServiceRepository)
  ServiceRepository get repository;

  @LazySingleton()
  ServiceApi serviceApi(Dio dio) => ServiceApi(dio);

  @LazySingleton()
  CatalogueApi catalogueApi(Dio dio) => CatalogueApi(dio);
}
