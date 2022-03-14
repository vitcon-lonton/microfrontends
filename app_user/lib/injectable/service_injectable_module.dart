import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/service/service.dart';

@module
abstract class ServiceInjectableModule {
  @Injectable()
  ServicesCubit get services;

  @Injectable()
  CategoriesCubit get categories;

  @Injectable()
  ServiceDetailCubit get serviceDetail;

  @Injectable()
  ServiceCheckingCubit get serviceChecking;

  @LazySingleton(as: IServiceRepository)
  ServiceRepository get repository;

  @LazySingleton()
  ServiceApi serviceApi(Dio dio) => ServiceApi(dio);

  @LazySingleton()
  CatalogueApi catalogueApi(Dio dio) => CatalogueApi(dio);
}
