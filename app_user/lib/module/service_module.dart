import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/service/service.dart';

@module
abstract class ServiceModule {
  @LazySingleton()
  CatalogueApi api(Dio dio) => CatalogueApi(dio);

  @LazySingleton(as: IServiceRepository)
  ServiceRepository get repository;

  @Injectable()
  ServicesCubit get servicesCubit;

  @Injectable()
  CategoriesCubit get categoriesCubit;

  @Injectable()
  ServiceDetailCubit get serviceDetailCubit;

  @Injectable()
  ServiceBookingFormCubit get serviceBookingFormCubit;
}
