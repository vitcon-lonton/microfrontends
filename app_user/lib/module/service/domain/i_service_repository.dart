import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'entities.dart';
import 'failure.dart';

abstract class IServiceRepository {
  Future<Option<Service>> detail(int id);
  Future<Option<List<Catalogue>>> getCatalogues();
  Future<Option<Pagination<Service>>> getServices(
      {required int page, required int perPage});
  Future<Either<ServiceFailure, Unit>> check(Service service);
}