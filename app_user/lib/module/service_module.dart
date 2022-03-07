import 'package:dio/dio.dart';
import 'package:service/service.dart';

import 'package:injectable/injectable.dart';

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
