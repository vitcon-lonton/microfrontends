import 'package:article/article.dart';
import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

@module
abstract class ArticleModule {
  @LazySingleton()
  ArticleApi api(Dio dio) => ArticleApi(dio);

  // @Injectable()
  //  BackendService getService(ApiClient client, @factoryParam String url) => BackendService(client, url);

  @Injectable()
  ArticlesCubit get articlesCubit;
}
