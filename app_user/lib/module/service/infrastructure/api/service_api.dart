part of 'api.dart';

@RestApi(baseUrl: 'https://shome.246.vn/api/v1/')
abstract class ServiceApi {
  factory ServiceApi(Dio dio, {String baseUrl}) = _ServiceApi;

  @GET('/services')
  Future<BaseResponse<GetAllData>> all();

  @GET('/services/{id}')
  Future<BaseResponse<Service>> detail(@Path() int id);
}
