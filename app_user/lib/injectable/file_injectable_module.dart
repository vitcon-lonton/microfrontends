import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:app_user/module/file/file.dart';

@module
abstract class FileInjectableModule {
  @Injectable()
  UploadFilesCubit get upload;

  @LazySingleton()
  FileApi api(Dio dio) => FileApi(dio);
}
