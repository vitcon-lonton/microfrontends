import 'package:dartz/dartz.dart';
import 'package:engine/engine.dart';

import 'entities.dart';
import 'failure.dart';

abstract class IServiceRepository {
  Future<Option<List<Catalogue>>> getCatalogues();
  Future<Option<Pagination<Service>>> getServices(
      {required int page, required int perPage});
  Future<Option<Service>> getServiceDetail({int? id});
  Future<Either<ServiceFailure, Unit>> check(Service service);
}
