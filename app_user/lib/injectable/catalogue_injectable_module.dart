import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/catalogue/catalogue.dart';

@module
abstract class CatalogueInjectableModule {
  @Injectable()
  CategoriesCubit get categories;

  @LazySingleton()
  CatalogueApi catalogueApi(Dio dio) => CatalogueApi(dio);
}
