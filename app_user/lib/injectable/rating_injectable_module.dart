import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/rating/rating.dart';

@module
abstract class RatingInjectableModule {
  @Injectable()
  RatingFormCubit get form;

  @LazySingleton(as: IRatingRepository)
  RatingRepository get repository;

  @LazySingleton()
  RatingApi api(Dio dio) => RatingApi(dio);
}
