import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/banner/banner.dart';

@module
abstract class BannerInjectableModule {
  @Injectable()
  BannersFindCubit get find;

  @LazySingleton()
  BannerApi api(Dio dio) => BannerApi(dio);
}
