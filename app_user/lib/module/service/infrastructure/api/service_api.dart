part of 'api.dart';

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/')
abstract class CatalogueApi {
  factory CatalogueApi(Dio dio, {String baseUrl}) = _CatalogueApi;

  @GET('/catalogues')
  Future<BaseResponse<List<CatalogueDto>>> all();
}

@RestApi(baseUrl: 'https://daiminhquang.acecom.vn/api/v1/')
abstract class ServiceApi {
  factory ServiceApi(Dio dio, {String baseUrl}) = _ServiceApi;

  @GET('/services')
  Future<BaseResponse<GetAllData>> all();

  @GET('/services/{id}')
  Future<BaseResponse<Service>> detail(@Path() int id);
}
