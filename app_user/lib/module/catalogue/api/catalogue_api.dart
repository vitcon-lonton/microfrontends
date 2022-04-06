part of 'api.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1/')
abstract class CatalogueApi {
  factory CatalogueApi(Dio dio, {String baseUrl}) = _CatalogueApi;

  @GET('/catalogues')
  Future<BaseResponse<List<Catalogue>>> all();
}
