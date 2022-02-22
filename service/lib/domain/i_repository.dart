import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'entities.dart';

abstract class IServiceRepository {
  Future<Either<ServiceFailure, Unit>> book(Service service);
  Future<Either<ServiceFailure, Service>> getServiceDetail();
  Future<Either<ServiceFailure, List<Service>>> getServices();
  Future<Either<ServiceFailure, List<Catalogue>>> getCatalogues();
}
