import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/option/option.dart';

@module
abstract class OptionInjectableModule {
  @Injectable()
  BannersFindCubit get bannersFind;

  @Injectable()
  GoogleKeyFindCubit get googleKeyFind;

  @LazySingleton()
  BaseApi api(Dio dio) => BaseApi(dio);
}
