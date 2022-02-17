import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'entities.dart';

abstract class IServiceRepository {
  Future<Option<List<Service>>> getServices();

  Future<Option<List<Category>>> getCategories();

  Future<Either<ServiceFailure, Unit>> book(Service service);
}
