import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../module/article/article.dart';

@module
abstract class ArticleInjectableModule {
  @Injectable()
  ArticlesCubit get articlesCubit;

  @LazySingleton()
  ArticleApi api(Dio dio) => ArticleApi(dio);
}

// @Injectable()
//  BackendService getService(ApiClient client, @factoryParam String url) => BackendService(client, url);
