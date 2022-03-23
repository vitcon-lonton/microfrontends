import 'package:dartz/dartz.dart';
import 'package:app_user/core/core.dart';
import 'package:kt_dart/kt.dart';
import 'entities.dart';
import 'failure.dart';

abstract class IServiceRepository {
  Future<Option<KtList<Catalogue>>> allCatalogue();
  Future<Either<ServiceFailure, Unit>> check(Service service);
  Future<Option<Service>> detail(int id);
  Future<Option<Pagination<Service>>> allService({int? page, int? perPage});
}
