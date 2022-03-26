import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'failure.dart';
import 'service.dart';

abstract class IServiceRepository {
  Future<Option<Service>> detail(int id);
  Future<Option<Pagination<Service>>> all({int? page, int? perPage});
  Future<Either<ServiceFailure, Unit>> check(Service service);
}
